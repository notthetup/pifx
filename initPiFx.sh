#!/bin/bash

# Kill mumble if it's already running
pkill mumble

#Kill pulseaudio if already running
if [ `pgrep pulseaudio` ]; then pulseaudio -k; fi

# Init Pulseaudio
DISPLAY=:0.0 pulseaudio --high-priority=1 & 

#Wait for Pulse to be init
until [ `pgrep pulseaudio` ]; do sleep 1; done;

# A bit more delay to stabilize things
sleep 2;

# Start Mumble
DISPLAY=:0.0 mumble "mumble://pifx@listen.webuild.sg/webuildsg-live?&version=1.2.0" &
