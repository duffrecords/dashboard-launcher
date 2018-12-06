#!/bin/bash

# create configuration from template
if [ ! -f "$(dirname $0)/conf/$(hostname -s).conf" ]; then
    cp "$(dirname $0)/default.conf" "$(dirname $0)/conf/$(hostname -s).conf"
fi

# install Upstart launcher
if [[ "$(uname -s)" == "Linux" ]]; then
    if [[ "$(lsb_release -is)" == "Ubuntu" ]]; then
        regex="s/USER/$(whoami)/"
        if which xfce4-session > /dev/null 2>&1; then
            destdir="~/.config/autostart/"
            launcher="dashboard-launcher.desktop"
        else
            destdir="~/.config/upstart"
            launcher="start-dashboard.conf"
        mkdir -p $destdir
        cp $launcher $destdir
        sed -i "$regex" ${destdir}${launcher}
    else
        echo "$(lsb_release -is) is not supported"
        exit 1
    fi
else
    echo "unsupported OS"
    exit 1
fi

