#!/usr/bin/env bash

# This script shows the battery indicator

# Author: Guillermo Kuster

battery_status_charging='↑'       # U+2191
battery_status_discharging='↓'    # U+2193

battery_charge=$(pmset -g batt | grep [0-9][0-9]% | awk 'NR==1{print $3}' | cut -c 1-3)
battery_status=$(pmset -g batt | grep [0-9][0-9]% | awk 'NR==1{print $4}' | rev | cut -c 2- | rev)

if [ "$battery_status" = "discharging" ]
then
  battery_status=$battery_status_discharging
else
  battery_status=$battery_status_charging
fi

echo $charged_icon $battery_charge
