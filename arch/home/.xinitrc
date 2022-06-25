#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# if [ -d /etc/X11/xinit/xinitrc.d ]; then
#   for f in /etc/X11/xinit/xinitrc.d/*; do
#     [ -x "$f" ] && . "$f"
#   done
#   unset f
# fi

# test -f ~/.Xkeymap && xkbcomp ~/.Xkeymap $DISPLAY &
# xrdb -merge ~/.Xresources &

# numlockx &
# # xautolock -time 5 -locker 'i3lock -i bg1.png' &
# redshift &

# emacsclient -c &
# # urxvt -e ncmpcpp & # CLI music player
# # chromium &           # Browser
# # firefox &
# # thunderbird &        # Mail client

# # Statusbar loop
# while true; do
#     xsetroot -name "$( date +"%b-%d %R" )"
#     sleep 1m    # Update time every minute
# done &

# xrandr --dpi 150
# xrandr --output HDMI-2 --auto --left-of eDP-1

# #hsetroot -solid "#000000" &
# # feh --bg-scale ~/laughingmanbg.png
# feh --bg-scale ~/Dropbox/wallpaper/vim-cheat-sheet.gif
# # compton -b

# # export GTK_IM_MODULE=fcitx
# # export QT_IM_MODULE=fcitx
# # export XMODIFIERS=@im=fcitx

# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im-ibus
# export QT_IM_MODULE=ibus
# ibus-daemon -rd

# #wmname compiz&        # Hackery for java/maple
# wmname LG3D

exec dwm
# dwm
echo xinitscrip > /tmp/washere
