#!/bin/sh

IFACE=$(ifconfig | grep ppp0 | awk '{print $1}')

if [ "$IFACE" = "ppp0:" ]; then
        echo "on"
else
    echo "off"
fi
