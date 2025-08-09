#!/bin/bash
# ~/.config/sway/battery-warn.sh

while true; do
  battery=$(cat /sys/class/power_supply/BAT0/capacity)
  status=$(cat /sys/class/power_supply/BAT0/status)

  if [ "$battery" -le 15 ] && [ "$status" = "Discharging" ]; then
    notify-send "⚠️ Batteria bassa ($battery%)"
  fi

  sleep 60
done
