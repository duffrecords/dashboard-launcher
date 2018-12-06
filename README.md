# dashboard-launcher

Launch a browser dashboard on a system when it starts up.  The startup script will wait until the wired network connection is up before starting the browser.  Currently only the following distributions are supported:
* Ubuntu
* Xubuntu

### Prerequisites
* xdotool
* a browser
* upstart (Ubuntu) or xfce4-session (Xubuntu)

### Installation
1. Run `./install.sh`
1. Edit `conf/[hostname].conf`
   1. `dash_url=` the URL to launch
   1. `browser=` the name of the browser binary (or full path to binary if not in `$PATH`)
   1. `commands=` (optional) space-delimited keyboard commands necessary to log into the page
1. Reboot

