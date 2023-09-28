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

