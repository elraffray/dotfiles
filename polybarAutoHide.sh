#!/bin/sh

# Check if xdo is installed
xdo_path=$(which xdo)
if [ $? -ne 0 ]; then
    echo "Cannot find \`xdo\` command." 1>&2
    exit 1
fi
# Obtain bar's window id
id=$(xwininfo -name "polybar-test_eDP-1" | grep "xwininfo: " | cut -d ' ' -f 4)
# Toggle bar visibility
if xprop -id $id | grep -q "Normal"; then
    xdotool windowunmap $id
else
    xdotool windowmap $id
fi