#!/bin/bash

log_file="$(dirname $0)/start-dashboard.log"
conf_file="$(dirname $0)/conf/$(hostname -s).conf"
cat /dev/null > $log_file

function log {
    echo "$(date +"%d/%b/%Y:%H:%M:%S %z") $@" >> $log_file
}

function exception {
    log "[ERROR] $@"
    exit 1
}

[ -f "$conf_file" ] || conf_file="$(dirname $0)/default.conf"
[ -f "$conf_file" ] || exception "could not open $conf_file"
source "$conf_file"
[ -z "$dash_url" ] && exception "dash_url is not defined in $(basename "$conf_file")"
[ -z "$browser" ] && exception "browser is not defined in $(basename "$conf_file")"
export DISPLAY=':0'
export XAUTHORITY="${HOME}/.Xauthority"
[ -f "$XAUTHORITY" ] || exception "could not open $XAUTHORITY"
which -s xdotool || exception "xdotool is not installed"
which -s $browser || exception "$browser is not installed"

# wait for network interface
if [[ "$(uname -s)" == "Linux" ]]; then
    while ! grep -q up /sys/class/net/en*/operstate; do
        sleep 3
    done
elif [[ "$(uname -s)" == "Darwin" ]]; then
    while ! scutil -r 8.8.4.4 > /dev/null 2>&1; do
        sleep 3
    done
fi

log "starting browser"
$browser "$dash_url" &
sleep 5
if [ ! -z "commands" ]; then
    for command in "$commands"; do
        xdotool key $command
    done
fi
log "setting browser to full screen mode"
xdotool key F11

