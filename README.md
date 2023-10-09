# RTL_433 HA Community Edition


This will be the main place that my rtl_433 work with Home Assistant will take place. Some things are ready, some are not. Read on


## RTL_433 MQTT Discovery Script

I am just hosting a script, I think regardless it is best if there are improvements to the current discovery script, until such time when an integration can be done correctly. I still firmly believe we should not be at the whim of a big project making breaking changes.

For example, most don't use the autodiscover because it finds all the entities you don't want, and doesn't have the ones we as a community do, such as contact sensors. Work done to improve the discovery script will not be wasted!


## rtl_433 HA .conf.template for existing Add On

I have updated a config template, to work with the existing "next" and standard branches. I have listed all available options with descriptions. Simply copy and paste what I have in your config template, then remove the "-" from what you don't want.


## RTL_433 Discovery Integration

This isn't ready yet. I plan to continue to work on it. The more I looked into fixing the Discovery Script. The more I realized a true integration was needed. 

I am actively looking into the best way to do this, and want to do it right. I am thinking of building a HACS Custom component using the websocks from rtl_433. Help and ideas welcome.


## rtl_433 HA Addon

I would like to take over the current HA addon for RTL_433. Currently waiting to see if the current maintainer would like me to do so, or if a fork is needed.
Similar to the discovery script, I feel it is worth doing right. Currently the add-on does indeed work. I have ideas on how to help make it better, and more transparent and easier to understand. 

## Todo plans

1. Add more to the auto discover script. We know the community done more. PIRs and Contact sensors are what we want, and they were not in the previous script I have started, but help is welcome

2. Documentation, and getting started improvements. That means good documentation for anyone looking to get into rtl_433 with an easy guide.

3. Make a new add-on repository, or take over current projects with edits.

4. Make an integration (not an add-on ) to replace the discovery script.

