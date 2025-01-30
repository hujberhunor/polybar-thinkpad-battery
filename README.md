# Polybar Thinkpad Battery Script

![Battery Full](https://github.com/user-attachments/assets/2b7ed049-3bef-428e-8248-d2af69852dfa)
![Battery Discharging](https://github.com/user-attachments/assets/7e7c0ba1-f466-4437-adfd-bec5fc920682)

## About the Repository
**This is my first project.**  
I’m new to GitHub and bash scripting, and I created this script with my current knowledge and some assistance from ChatGPT to solve a problem I couldn’t find a solution for.  
**Tested only on a ThinkPad T480.**

# ThinkPad Battery Status for Polybar
A Polybar module for monitoring ThinkPad batteries, dynamically handling multiple battery systems, displaying charge status, and providing a Rofi-based menu for detailed information.

## Screenshots
- **Battery at Full Capacity** (White LED on port)
  
  ![at-full](https://user-images.githubusercontent.com/50179148/221407983-4ed8b309-f510-41e4-aed8-97aae583edac.png)

- **Unplugged and Discharging** (No LED on port)
  
  ![discharge](https://user-images.githubusercontent.com/50179148/221407987-7edfc716-d989-42a2-999f-c996f53c82da.png)

- **Charging** (Red LED on port)
  
  ![charging](https://user-images.githubusercontent.com/50179148/221408249-b0268a4b-9fd5-48ff-8ad8-55a2a84d9507.png)

- **Left Click Module Display**
  
  ![rofi](https://github.com/hujberhunor/polybar-thinkpad-battery/assets/50179148/f66044d5-9d2a-458a-9d66-3bb00c8c0851)

## Features
- Calculates the weighted average of battery charge based on capacity (24Wh, 48Wh, or 72Wh)
- Displays charge status (charging, discharging, AC power) and current power consumption
- A single click opens a Rofi-based menu with detailed battery information
- Automatically detects and adjusts for battery swaps (e.g., switching between 24Wh and 72Wh)

## What's New
- **Support for 24Wh and 72Wh batteries**
- **Automatic battery detection**: If a larger capacity battery (e.g., 72Wh) is connected as BAT1, the script automatically updates weight calculations

## Dependencies
- `acpi` (to check battery status)
- `rofi` (for the clickable menu)
- `Nerd Fonts` or `Awesome Fonts` (for icons)

## \*\* \*\*Installation

1. **Copy the scripts to an accessible location, e.g.:**

```bash
mkdir -p ~/.config/polybar
cp bat-status-bar.sh bat-dropdown-rofi.sh ~/.config/polybar/
```

2. **Add the following to your Polybar configuration** (`~/.config/polybar/config.ini`):

```ini
[module/battery]
type = custom/script
exec = ~/.config/polybar/bat-status-bar.sh
click-left = ~/.config/polybar/bat-dropdown-rofi.sh
interval = 10
```

3. **Update the Rofi theme in ****************************`bat-dropdown-rofi.sh`**************************** if necessary:**

```bash
rofi -show run -theme ~/.config/polybar/batteries_rofi_style.rasi
```

If you prefer a custom theme, edit the corresponding `.rasi` file.

## Rofi Theme

The Rofi theme is based on [@adi1090x](https://github.com/adi1090x/rofi). If you prefer a custom theme, modify the `batteries_rofi_style.rasi` file!

---

*Note*: I don’t own the Rofi style configuration; it’s credited to @adi1090x, and credentials are included in the file.
