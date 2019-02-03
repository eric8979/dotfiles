#!/bin/bash

N=1
ls $HOME/Pictures/Wallpapers |sort -R |tail -$N |while read file; do
	nitrogen --set-scaled $HOME/Pictures/Wallpapers/$file
done

