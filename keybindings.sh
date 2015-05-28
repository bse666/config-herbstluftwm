#!/bin/bash

#####################################################################################################
# HERBSTLUFT KEYBINDINGS
#####################################################################################################




#==========================================================================================
# MOD KEY
#==========================================================================================

# Mod1=Alt, Mod4=Win
Mod=Mod4



#==========================================================================================
# TAGS
#==========================================================================================

tag_names=( {1..9} )
tag_keys=( {1..9} 0 )

hc rename default "${tag_names[0]}" || true
for i in ${!tag_names[@]} ; do
	hc add "${tag_names[$i]}"
	key="${tag_keys[$i]}"
	if ! [ -z "$key" ] ; then
		# select/move tags directly
		hc keybind "$Mod-$key" use_index "$i"
		hc keybind "$Mod-Shift-$key" move_index "$i"
	fi
done

# cycle through tags
hc keybind $Mod-period		use_index	+1 --skip-visible
hc keybind $Mod-comma		use_index	-1 --skip-visible



#==========================================================================================
# BASIC
#==========================================================================================

hc keybind $Mod-Shift-e		quit
hc keybind $Mod-Shift-r		reload
hc keybind $Mod-Shift-q		close
hc keybind $Mod-t		spawn	xfce4-terminal
hc keybind $Mod-d		spawn	dmenu_run -fn '-*-dejavu sans mono-medium-r-normal-*-12-*-*-*-*-*-*-*'
hc keybind $Mod-Shift-k		spawn	shutdown -h now
hc keybind $Mod-Shift-j		spawn	shutdown -r now
hc keybind $Mod-l		spawn	i3lock -c 000000



#==========================================================================================
# CLIENTS
#==========================================================================================

# focusing clients
hc keybind $Mod-Left		focus	left
hc keybind $Mod-Down		focus	down
hc keybind $Mod-Up		focus	up
hc keybind $Mod-Right		focus	right

# moving clients
hc keybind $Mod-Shift-Left	shift	left
hc keybind $Mod-Shift-Down	shift	down
hc keybind $Mod-Shift-Up	shift	up
hc keybind $Mod-Shift-Right	shift	right



#==========================================================================================
# FRAMES
#==========================================================================================

# splitting frames
hc keybind $Mod-h		split   bottom  0.5
hc keybind $Mod-v		split   right   0.5
hc keybind $Mod-e		split	explode

# resizing frames
resizestep=0.05
hc keybind $Mod-Control-Left	resize	left	+$resizestep
hc keybind $Mod-Control-Down	resize	down	+$resizestep
hc keybind $Mod-Control-Up	resize	up	+$resizestep
hc keybind $Mod-Control-Right	resize	right	+$resizestep

# resizing gap
hc keybind $Mod-g               cycle_value frame_gap 0 10 20 30 40 50 60 80
hc keybind $Mod-Shift-g         cycle_value frame_gap 80 60 50 40 30 20 10 0 




#==========================================================================================
# LAYOUTING
#==========================================================================================

hc keybind $Mod-r		remove
hc keybind $Mod-space		cycle_layout 1
hc keybind $Mod-s		floating toggle
hc keybind $Mod-f		fullscreen toggle
hc keybind $Mod-p		pseudotile toggle



#==========================================================================================
# FOCUS
#==========================================================================================

hc keybind $Mod-m		cycle_monitor
hc keybind $Mod-Tab		cycle_all +1
hc keybind $Mod-Shift-Tab	cycle_all -1
hc keybind $Mod-c		cycle



#==========================================================================================
# STUFF
#==========================================================================================

# stuff
hc keybind $Mod-b		spawn	chromium --force-device-scale-factor=1
hc keybind $Mod-Shift-b		spawn	chromium --force-device-scale-factor=1 --incognito

# cmus
hc keybind $Mod-F9		spawn	cmus-remote -s	# stop
hc keybind $Mod-F10		spawn	cmus-remote -u	# pause
hc keybind $Mod-F11		spawn	cmus-remote -r	# previous
hc keybind $Mod-F12		spawn	cmus-remote -n	# next
