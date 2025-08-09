#!/bin/sh

THRESHOLD=20

while true; do
  BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT1/capacity)
  BATTERY_STATUS=$(cat /sys/class/power_supply/BAT1/status)

  if [ "$BATTERY_LEVEL" -le "$THRESHOLD" ] && [ "$BATTERY_STATUS" != "Charging" ]; then
    notify-send "⚠️ Battery Critical" "Battery is at ${BATTERY_LEVEL}%! Please charge immediately."
  fi
  sleep 2 # Sleep for 2 seconds before checking again
done
