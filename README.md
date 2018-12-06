# dashboard-launcher

Launch a browser dashboarrd on a system when it starts up.  Currently only Ubuntu is supported.

### Prerequisites
* xdotool
* a browser
* Upstart

### Installation
1. Run `./install.sh`
2. Edit `conf/[hostname].conf`
  1. Add the URL to launch
  2. Add the name of the browser binary (or full path to binary if not in `$PATH`)
3. Reboot

