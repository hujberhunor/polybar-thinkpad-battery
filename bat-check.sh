#!/bin/bash
## CHECK IF THE DISCHARGING BATTERY IS BELOW 5%
## TO ENSURE THAT THERE IS NO PROBLEM WHILE USING
## POWER BRIDGE SYSTEM AND SWAPPING BATTERIES IN MY T480

# TO KILL THE SCRIPT
## pgrep -f battery_check.sh  # Get the process ID
## kill <PID>                  # Replace <PID> with the actual process ID

# Systemd service created in /etc/systemd/system/battery_monitor.service

LOGFILE="$HOME/.scripts/background/battery_monitor.log"

# Function to check battery status
check_battery() {
    BAT=$1
    # Get battery percentage and status
    if [ -d "/sys/class/power_supply/$BAT" ]; then
        BATTERY_PERCENTAGE=$(cat /sys/class/power_supply/$BAT/capacity)
        BATTERY_STATUS=$(cat /sys/class/power_supply/$BAT/status)

        # If battery is discharging and percentage is below 5%
        if [ "$BATTERY_STATUS" == "Discharging" ] && [ "$BATTERY_PERCENTAGE" -lt 7 ]; then
            # Send notification with larger font, no timeout, and warning icon
            notify-send -u critical -t 0 -i "dialog-warning" "Battery Alert" \
                        "<span color='red'>$BAT is below 7% |\n Currently ($BATTERY_PERCENTAGE%)</span>"
            echo "$(date): $BAT is below 7% ($BATTERY_PERCENTAGE%)" >> "$LOGFILE"
        fi
    fi
}

# Monitor both batteries (BAT0 and BAT1)
while true; do
    check_battery "BAT0"
    check_battery "BAT1"
    sleep 30  # Check every minute
done

