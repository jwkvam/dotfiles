#!/bin/sh

setxkbmap -option ctrl:swapcaps
setxkbmap -option terminate:ctrl_alt_bksp
urxvtd -q -f -o
volumeicon &
parcellite &

echo $@ > xtxt

case $2 in
    awesome) exec awesome;;
    i3) exec i3;;
    *) exec awesome;;
esac
