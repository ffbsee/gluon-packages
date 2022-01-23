# gluon-packages
contains the following packages

### ffbsee-alfred
Providing node information via alfred-service, that will be shown on map.

- **print_map.sh**

  Showing and publishing the usual data for our maps

- **robin_print_map.sh**

  Showing and publishing advanced data collected for performance monitoring e.g. grafana boards

- **wgetspeedtest.sh**

  Performs a speedtest via wget. part of the performance data

### ffbsee-cli-basics
Adds cli-basic-tools. e.g. nano

### ffbsee-config-mode-theme
Our ffbsee-custom theme for config mode. More responsive than the orginal one.

### ffbsee-setup-mode 
Trigger the setup-mode.
We activate setup-mode for one hour after pressing a certain button on the router.

### ffbsee-wifiscan
* Executes a scan for all the channels, ssids, signal-strength on air.
* Result is just a json-Array.
* Future Purpose:
  * failure analyses in case of bad wifi complaints
  * config: not-meshing devices could want to change their channel