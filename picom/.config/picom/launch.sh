#!/bin/bash

killall -q picom

# Wait until the processes have been shut down
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

picom -b --config $HOME/.config/picom/picom.conf

echo "Compton launched..."
