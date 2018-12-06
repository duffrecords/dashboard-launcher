#!/bin/bash

# create configuration from template
if [ ! -f "$(dirname $0)/conf/$(hostname -s).conf" ]; then
    cp "$(dirname $0)/default.conf" "$(dirname $0)/conf/$(hostname -s).conf"
fi

# install Upstart launcher
if [[ "$(uname -s)" == "Linux" ]]; then
    if [[ "$(lsb_release -is)" == "Ubuntu" ]]; then
        mkdir -p ~/.config/upstart
        cp start-dashboard.conf ~/.config/upstart/
        regex="s/USER/$(whoami)/"
        sed -i "$regex" ~/.config/upstart/start-dashboard.conf
    else
        echo "$(lsb_release -is) is not supported"
        exit 1
    fi
else
    echo "unsupported OS"
    exit 1
fi

