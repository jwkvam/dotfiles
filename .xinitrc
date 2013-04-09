#!/bin/sh

setxkbmap -option ctrl:swapcaps
setxkbmap -option terminate:ctrl_alt_bksp
urxvtd -q -f -o
parcellite &


exec awesome
