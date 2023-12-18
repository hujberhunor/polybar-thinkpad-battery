# polybar-thinkpad-battery

## About the repo
**This is my first "project".** I dont know anything about github and how to use it or even about bash.
I made this script with my existing knowlege and chatGPT help to solve the problem i couldnt find solution.

## What does this script does?
Polybar script/module that takes your 2 batteries average (weighted) and displays it + the status (chargint, discharging etc). 
Then displays the current watt usage. The "AC" tag displays that if the cabel is plugged or not. 

## Dependencies(?)
nerdfont / awesomefonts for the icon. if you want different icon in terminal press ctrl+alt+u and then select one, this tool will automatically paste the selected icon. 

---
battery at full (threshold) capacity (when the light on the port is white
![at-full](https://user-images.githubusercontent.com/50179148/221407983-4ed8b309-f510-41e4-aed8-97aae583edac.png)

When unplugged and discharging (no light on the port)
![discharge](https://user-images.githubusercontent.com/50179148/221407987-7edfc716-d989-42a2-999f-c996f53c82da.png)

When charging (red led on the port)
![chargint](https://user-images.githubusercontent.com/50179148/221408249-b0268a4b-9fd5-48ff-8ad8-55a2a84d9507.png)

Left click on the module:
![rofi](https://github.com/hujberhunor/polybar-thinkpad-battery/assets/50179148/f66044d5-9d2a-458a-9d66-3bb00c8c0851)


## How to install
I dont know how to create a script so you have to do this manually. 
You have to edit x files:
1. batteries_rofi.sh - change the `rofi_theme =` path to the style.
2. polybar config file - just copy/paste the module into yours and then add the path to the of the battery.sh script to the `exec = ` part and the second batteries_rofi.sh -s path to the `left-click =`.

3. in the `avg_battery.sh` file you have to specify the weights that you want to use. I have a 72Wh and a 24Wh battery, so i used 25,72 weight. If you have batteries with the same capacity then comment that part out and use the simple average line.

Thats all. For modifications ask chatGPT or make an issue i think.
Edit: I dont own the rofi style config, i found it somewhere, the credentials are in the file. Thank you @adi1090x.
