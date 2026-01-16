userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Disable DPMS turning off the screen
xset s off
xset -dpms

# Disable bell
xset -b

# Enable zapping (C-A-<Bksp> kills X)
setxkbmap -option terminate:ctrl_alt_bksp
# Alt+Shift toggles locales
setxkbmap -model pc104 -layout us,ru -variant ,, -option grp:alt_shift_toggle

# Enforce correct locales from the beginning:
# LC_ALL is unset since it overwrites everything
# LANG=de_DE.UTF-8 is used, except for:
# LC_MESSAGES=C never translates program output
# LC_TIME=en_DK leads to yyyy-mm-dd hh:mm date/time output
unset LC_ALL
export LANG=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=en_US.UTF-8

# Use XToolkit in java applications
export AWT_TOOLKIT=XToolkit

# Set background color
xsetroot -solid "#1d2021"

clipmenud &
dunst &
gxkb &
pasystray &

#xrandr --output VGA-1 --auto --output VGA-1-2 --auto --right-of VGA-1

exec i3
