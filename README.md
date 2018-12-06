# dashboard-launcher

Launch a browser dashboarrd on a system when it starts up.  Currently only Ubuntu is supported.

### Prerequisites
* xdotool
* a browser
* Upstart

### Installation
1. Run `./install.sh`
1. Edit `conf/[hostname].conf`
   1. `dash_url=` the URL to launch
   1. `browser=` the name of the browser binary (or full path to binary if not in `$PATH`)
   1. `commands=` (optional) space-delimited keyboard commands necessary to log into the page
1. Reboot

