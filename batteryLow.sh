
#!/bin/bash

#Get Battery percentage using acpi:
battery_percentage=$(acpi -b | grep 'Battery 0' | awk '{print $4}' | tr -d ',' | tr -d '%' | bc)

#Check if charger connected is online or not
adpter_online=$(acpi -a | awk '{print $3}')

var=$(acpi -b | awk '{print $3}' | tr -d ',' )

if [ "$battery_percentage" -eq 100 ] && [ "$adpter_online" == "on-line" ]; then
	paplay /home/aamir/Downloads/battery_full.mp3
	break
elif [ "$battery_percentage" -lt 15 ] && [ "$adpter_online" == "off-line" ]; then
	paplay /home/aamir/Downloads/jarvis_low_battery.mp3
	break
fi
