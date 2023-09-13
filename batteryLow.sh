
#!/bin/bash

#Get Battery percentage using acpi:
battery_percentages=$(acpi -b | awk '{print $4}' | tr -d ',' | tr -d '%')

#Check if charger connected is online or not
adpter_online=$(acpi -a | awk '{print $3}')

var=$(acpi -b | awk '{print $3}' | tr -d ',' )

for battery_percentage in $battery_percentages; do
	if [ "$battery_percentage" -eq 0 ]; then
		break
	elif [ "$battery_percentage" -eq 100 ] && [ "$adpter_online" == "on-line" ]; then
	        paplay /home/aamir/Downloads/battery_full.mp3
	        break
	elif [ "$battery_percentage" -lt 15 ] && [ "$adpter_online" == "off-line" ]; then
	        paplay /home/aamir/Downloads/jarvis_low_battery.mp3
	        break
	fi
done	
