#!/usr/bin/env bash

# This script shows the battery percentage

# Author: Guillermo Kuster

charged_icon="♥"
battery_charge=$(pmset -g batt | grep [0-9][0-9]% | awk 'NR==1{print $3}' | cut -c 1-3)

echo $charged_icon $battery_charge
