# RTL_433 HA Community Edition

## Rtl_433 HA Discovery
This will be the main place that rtl_433 discovery script will be hosted from now on. I firmly believe that the script should be owned and used by the HA community, without all the large changes that come with a massive (and amazing) project such as RTL_433.

For example, most don't use the autodiscover because it finds all the entities you don't want, and doesn't have the ones we as a community do, such as contact sensors. 

I could have simply added everything to MQTT manually, but I wanted to help the community, and especially seeing the current rtl_433 (HA add-on) project is looking for a new maintainer.

These add-ons/scripts and intergrations will have version numbers. So you will not need to uninstall and reinstall just to update.


## RTL_433 Discovery Script Add on

https://github.com/catduckgnaf/rtl_433_haos_autodiscovery_addon

If you are to lazy to click the link and use the readme, you probably shouldn't be using this. But here is an easy way to add the repository regardless 

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/catduckgnaf/rtl_433_haos_autodiscovery_addon/)


The add on fixes many of the existing problems with the autodiscovery script. You are currently able to specify one device code to add at a time, it works with all versions and supports more devices, with plans to add more.

## rtl_433 HA Addon

https://github.com/catduckgnaf/rtl_433_haos_addon

If you are to lazy to click the link and use the readme, you probably shouldn't be using this. But here is an easy way to add the repository regardless.

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/catduckgnaf/rtl_433_haos_addon/)


I have updated a config template, to work with the existing "next" and standard branches. I have listed all available options with descriptions. Simply copy and paste what I have in your config template, then remove the "-" from what you don't want.

I plan to maintain rolloing releases to prevent the main project from making breaking changes, additionally for updates you will not need to uninstall and reinstall.

## RTL_433 Discovery Script Intergration:

Doesn't exist yet, but its on my list. Currently working on improving the existing script more. If you are not on HAOS you can use it with HACS Python Scripts for the time being.


## Future plans


1. Make a new add-on repository, or take over current projects with edits. Seperate for discovery and rtl_433.

2. Make an intergration (not an add-on ) for the discovery script, or maybe even simply instructions on how to use it with HACS and Python scripts to start.

3. Documentation, and getting started improvements. That means good documentation for anyone looking to get into rtl_433 with an easy guide.

4. Add more to the auto discover script. We know the community done more. PIRs and Contact sensors are what we want, and they were not in the previous script I have started, but help is welcome

5. A gui would be cool, right?
