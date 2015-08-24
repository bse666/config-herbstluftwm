#1/bin/bash
##################################
### HERBSTLUFT SHUTDOWN PROMPT ###
##################################




dialog --menu "Shutdown:" 10 40 3 \
	L "Logoff" \
	S "Shutdown" \
	R "Reboot" \
	2>/tmp/temp

input=$(cat /tmp/temp)
rm -f /tmp/temp

case $input in
	"L")
		dialog --passwordbox "Password:" 10 40 \
		2>/tmp/temp
		password=$(cat /tmp/temp)
		rm -f /tmp/temp
		
