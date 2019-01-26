#!/usr/bin/env bash

bgimage="$1"
icon="$2"

(( $# )) && { icon=$1; }

# convert "$bgimage" "$icon" -gravity center -composite -matte "$bgimage"
i3lock -i "$bgimage"
