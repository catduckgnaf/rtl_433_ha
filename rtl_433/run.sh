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
    cat > $conf_directory/rtl_433.conf <<EOD


# device must be set before mqtt output lines.
# https://github.com/merbanan/rtl_433/blob/master/conf/rtl_433.example.conf

# output mqtt://\${host}:\${port},user=\${username},pass=\${password},retain=\${retain}
#report_meta time:iso:usec:tz

# To keep the same topics when switching between the normal and edge versions,
# use this output line instead.
output mqtt://\${host}:\${port},user=\${username},pass=\${password},retain=\${retain},devices=rtl_433/9b13b3f4-rtl433/devices[/type][/model][/subtype][/channel][/id],events=rtl_433/9b13b3f4-rtl433/events,states=rtl_433/9b13b3f4-rtl433/states

# Uncomment the following line to also enable the default "table" output to the
# addon logs.
# output kv



EOD
fi


wait -n ${rtl_433_pids[*]}
