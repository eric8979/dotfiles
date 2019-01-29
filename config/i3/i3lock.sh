#!/usr/bin/env bash

bgimage="$1"
icon="$2"

(( $# )) && { icon=$1; }

i3lock -i "$bgimage"
