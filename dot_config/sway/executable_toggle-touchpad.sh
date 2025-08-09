#!/bin/bash
# toggle-touchpad.sh

DEVICE="1739:33364:Synaptics_TM3336-004"
STATUS=$(swaymsg -t get_inputs | grep -A5 "$DEVICE" | grep enabled)

if [[ $STATUS == *"enabled"* ]]; then
  swaymsg input "$DEVICE" events disabled
else
  swaymsg input "$DEVICE" events enabled
fi
