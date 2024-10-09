#!/bin/bash
## This script is handled by POLYBAR config

# Get the current battery levels
bat0=$(cat /sys/class/power_supply/BAT0/capacity) # INTERNAL
bat1=$(cat /sys/class/power_supply/BAT1/capacity) # EXTERNAL

# Get the wh counts of the batteries
bat0_wh=$(cat /sys/class/power_supply/BAT0/energy_full_design)/1000000
bat1_wh=$(cat /sys/class/power_supply/BAT1/energy_full_design)/1000000

# Define the weights for each battery capacity 
weight1=24  # internal
weight2=72  # external 

# Determine the calculation method based on wh values
# If both batteries wh is less then 25(wh) then use SIMPLE avg calculation
# ELSE use the WEIGHTED method
if [[ "$bat0_wh" -le 25 && "$bat1_wh" -le 25 ]]; then
  # Both batteries are around 24000000, use non-weighted average
  average=$(( (bat0 + bat1) / 2 ))
else
  # At least one battery is larger (around 71280000), use weighted average
  total_weight=$((weight1 + weight2))
  average=$(( (bat0 * weight1 + bat1 * weight2) / total_weight ))
fi

# Get the charging status of each battery
status1=$(cat /sys/class/power_supply/BAT0/status)
status2=$(cat /sys/class/power_supply/BAT1/status)

# Check if any of the batteries is charging
charging=false
if [ "$status1" == "Charging" ] || [ "$status2" == "Charging" ]; then
  charging=true
fi

# Battery current watt usage
if [ $(cat /sys/class/power_supply/BAT1/power_now) -eq 0 ]; then
  bat_watt=$(echo "scale=2; $(cat /sys/class/power_supply/BAT0/power_now)/1000000" | bc)W
else
  bat_watt=$(echo "scale=2; $(cat /sys/class/power_supply/BAT1/power_now)/1000000" | bc)W
fi

# Get the AC adapter status
ac_status=$(cat /sys/class/power_supply/AC/online)

# Output the battery levels, charging status, and AC adapter status
## Charging and AC is connected -> Green display
if [ "$charging" == true ] && [ "$ac_status" == 1 ]; then
  echo "%{F#00ff00}↑%{F-}%{F#00ff00}%{F-}  $average% $bat_watt AC" 

## Not charging and AC is connected (so batteries at threshold) -> White display
elif [ "$charging" == false ] && [ "$ac_status" == 1 ]; then
  echo "%{F#FFFFFF}%{F-} $average% AC"  

## Average battery are under 26% -> Red display
elif [ "$average" -lt 16 ]; then
  echo "%{F#FF0000}%{F-} $average% $bat_watt"  

## Else discharging
else
  echo "%{F#FFAA00}%{F-} $average% $bat_watt" 
fi
