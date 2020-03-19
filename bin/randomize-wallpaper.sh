#!/bin/bash

# Get focused display
focused=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output'`

echo ".$focused."
if [ "$focused" = "\"eDP-1\"" ]; then
    focused=0
else
    focused=1
fi
focused=0 # disabling main monitor when docked so always screen 0
echo ".$focused."

N=1
ls $HOME/Pictures/Wallpapers |sort -R |tail -$N |while read file; do
	nitrogen --force-setter=xinerama --set-scaled --head=$focused $HOME/Pictures/Wallpapers/$file
done

