# Get the current battery levels
bat1=$(cat /sys/class/power_supply/BAT0/capacity)
bat2=$(cat /sys/class/power_supply/BAT1/capacity)

echo "$bat1% $bat2%"
