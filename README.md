# Polybar Thinkpad Battery Script

![Battery Full](https://github.com/user-attachments/assets/2b7ed049-3bef-428e-8248-d2af69852dfa)
![Battery Discharging](https://github.com/user-attachments/assets/7e7c0ba1-f466-4437-adfd-bec5fc920682)

## About the Repository
**This is my first project.**  
I’m new to GitHub and bash scripting, and I created this script with my current knowledge and some assistance from ChatGPT to solve a problem I couldn’t find a solution for.  
**Tested only on a ThinkPad T480.**

## UPDATE
The scripts are renamed: `avg-bat.sh` is `bat-status-bar.sh` and `batteries-rofi.sh` is `bat-dropdown-rofi.sh`.

## Script Overview
This Polybar module:
1. Calculates the weighted average of your two batteries' charge levels. 
2. Displays the charge status (charging, discharging, AC) along with current wattage.

### New Features
The script now supports 24Wh and 72Wh batteries. It detects which one is in the system, so you can swap them on the fly, and the script will adjust accordingly. If an external 72Wh (or any battery larger than 24Wh) is used as BAT1, the `avg_updated.sh` script reads the Wh value and adjusts the average calculation weight based on that.

## Dependencies
Requires **Nerd Fonts** or **Awesome Fonts** for the icons.

## Screenshots
- **Battery at Full Capacity** (White LED on port)
  
  ![at-full](https://user-images.githubusercontent.com/50179148/221407983-4ed8b309-f510-41e4-aed8-97aae583edac.png)

- **Unplugged and Discharging** (No LED on port)
  
  ![discharge](https://user-images.githubusercontent.com/50179148/221407987-7edfc716-d989-42a2-999f-c996f53c82da.png)

- **Charging** (Red LED on port)
  
  ![charging](https://user-images.githubusercontent.com/50179148/221408249-b0268a4b-9fd5-48ff-8ad8-55a2a84d9507.png)

- **Left Click Module Display**
  
  ![rofi](https://github.com/hujberhunor/polybar-thinkpad-battery/assets/50179148/f66044d5-9d2a-458a-9d66-3bb00c8c0851)

## Installation Guide
This setup is manual, so you’ll need to edit a few files directly:

1. **`batteries_rofi.sh`**  
   - Update the `rofi_theme` path to your preferred style file. The style file I use, `batteries_rofi_style.rasi`, is included in the repository.

2. **Polybar Configuration File**  
   - Copy/paste the module configuration into your Polybar config file.
   - Set the path for `battery.sh` in the `exec` field.
   - Specify the path to `batteries_rofi.sh` in the `left-click` field.

3. **`avg_battery.sh`**  
   - Set the weights for battery averaging based on your battery capacities. For example, I use weights of 25 and 72 for my 24Wh and 72Wh batteries. If your batteries have the same capacity, comment out this section and use the simple average calculation instead.

*Note*: I don’t own the Rofi style configuration; it’s credited to @adi1090x, and credentials are included in the file.
