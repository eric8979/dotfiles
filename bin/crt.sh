#!/bin/bash

out=`curl "https://crt.sh/?output=json&q=%25.$1" 2>/dev/null`
echo $out | jq '.[].name_value' | sed -e 's/\\n/\n/g' | sed -e 's/"//g' | sort -u

