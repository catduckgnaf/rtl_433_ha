#!/usr/bin/with-contenv bashio

conf_directory="/config/rtl_433"
autodiscover_directory="/config/rtl_433/scripts"

if bashio::services.available "mqtt"; then
    host=$(bashio::services "mqtt" "host")
    password=$(bashio::services "mqtt" "password")
    port=$(bashio::services "mqtt" "port")
    username=$(bashio::services "mqtt" "username")
    retain=$(bashio::config "retain")
else
    bashio::log.info "The mqtt addon is not available."
    bashio::log.info "Manually update the output line in the configuration file with mqtt connection settings, and restart the addon."
fi

if [ ! -d $conf_directory ]
then
    mkdir -p $conf_directory
fi

if [ ! -d $autodiscover_directory ]
then
    mkdir -p $autodiscover_directory
fi

OTHER_ARGS=""
  if bashio::config.true "run_auto_discover"; then
    OTHER_ARGS="${OTHER_ARGS} python3 -u $conf_directory/rtl_433_mqtt_hass.py -H $MQTT_HOST -p $MQTT_PORT -R "$RTL_TOPIC" -D "$DISCOVERY_PREFIX" -i $DISCOVERY_INTERVAL $OTHER_ARGS"
  fi
  if bashio::config.true "force_update"; then
    OTHER_ARGS="${OTHER_ARGS} --force_update"
  fi


# Check if the legacy configuration file is set and alert that it's deprecated.
conf_file=$(bashio::config "rtl_433_conf_file")

if [[ $conf_file != "" ]]
then
    bashio::log.warning "rtl_433 now supports automatic configuration and multiple radios. The rtl_433_conf_file option is deprecated. See the documentation for migration instructions."
    conf_file="/config/$conf_file"

    echo "Starting rtl_433 -c $conf_file"
    rtl_433 -c "$conf_file"
    exit $?
fi

# Create a reasonable default configuration in /config/rtl_433.
if [ ! "$(ls -A $conf_directory)" ]
then
    cat > $conf_directory/rtl_433.conf.template <<EOD
this is a test
EOD
fi

# Remove all rendered configuration files.
rm -f $conf_directory/*.conf

rtl_433_pids=()
for template in $conf_directory/*.conf.template
do
    # Remove '.template' from the file name.
    live=$(basename $template .template)

    # By sourcing the template, we can substitute any environment variable in
    # the template. In fact, enterprising users could write _any_ valid bash
    # to create the final configuration file. To simplify template creation,
    # we wrap the needed redirections into a temparary file.
    echo "cat <<EOD > $live" > /tmp/rtl_433_heredoc
    cat $template >> /tmp/rtl_433_heredoc

    # Ensure a newline exists in case the template doesn't have one at the end
    # of its file.
    echo >> /tmp/rtl_433_heredoc

    echo EOD >> /tmp/rtl_433_heredoc

    source /tmp/rtl_433_heredoc

    echo "Starting rtl_433 with $live..."
    tag=$(basename $live .conf)
    rtl_433 -c "$live" > >(sed -u "s/^/[$tag] /") 2> >(>&2 sed -u "s/^/[$tag] /")&
    rtl_433_pids+=($!)
done

wait -n ${rtl_433_pids[*]}
