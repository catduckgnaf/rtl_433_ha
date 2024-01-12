# RTL_433 HA Community Edition


This will be the main place that my rtl_433 work with Home Assistant will take place. Some things are ready, some are not. Read on


## RTL_433 MQTT Discovery Script

I am just hosting a script, I think regardless it is best if there are improvements to the current discovery script, until such time when an integration can be done correctly. I still firmly believe we should not be at the whim of a big project making breaking changes.

For example, most don't use the autodiscover because it finds all the entities you don't want, and doesn't have the ones we as a community do, such as contact sensors. Work done to improve the discovery script will not be wasted!


# If you are using the RTL_433 HA Community Edition (By Catduck) This is the script that comes installed.
Currently it does not get updated with each release. So feel free to check any changes made to the script in the changelog.md


## rtl_433 HA .conf.template for existing Add On

I have updated a config template, to work with the existing "next" and standard branches. I have listed all available options with descriptions. Simply copy and paste what I have in your config template, then remove the "-" from what you don't want.


## RTL_433 Discovery Integration

This isn't ready yet. I plan to continue to work on it. The more I looked into fixing the Discovery Script. The more I realized a true integration was needed. 

I am actively looking into the best way to do this, and want to do it right. I am thinking of building a HACS Custom component using the websocks from rtl_433. Help and ideas welcome.


## rtl_433 HA Addon

Here is my version of just the rtl_433 Next Add On. I am not actively working on it, because the current version works. I am spending time on my intergration instead, and when thats ready, will see what I neeed to customize.

Basically feel free to use this, or keep using the "old" one.

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/catduckgnaf/rtl_433_haos_addon/)


## Todo plans

1. Add more to the auto discover script. We know the community done more. PIRs and Contact sensors are what we want, and they were not in the previous script I have started, but help is welcome

2. Documentation, and getting started improvements. That means good documentation for anyone looking to get into rtl_433 with an easy guide.

3. Make a new add-on repository, or take over current projects with edits.

4. Make an integration (not an add-on ) to replace the discovery script.

