#!/bin/bash
#scrot /tmp/ss.png
#convert /tmp/ss.png -blur 0x5 /tmp/ss-blur.png
#i3lock -d -i /tmp/ss-blur.png -n

revert() {
    rm /tmp/*screen*.png
    xset dpms 0 0 0 
}

trap revert HUP INT TERM
xset +dpms dpms 0 0 5
scrot -d 1 /tmp/locking_screen.png
convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
convert -composite /tmp/screen_blur.png ~/.config/i3/rm.png -gravity South -geometry -20x1200 /tmp/screen.png
i3lock -d -i /tmp/screen.png
revert
