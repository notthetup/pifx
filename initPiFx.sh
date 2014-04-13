#!/bin/bash

# Kill mumble if it's already running
pkill mumble

# A bit more delay to stabilize things
sleep 2;

# Start Mumble
DISPLAY=:0.0 mumble "mumble://pifx@listen.webuild.sg/webuildsg-live?&version=1.2.0" &

#aplay -D hw:0,1 /usr/share/sounds/alsa/Front_Left.wav
