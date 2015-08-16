#!/bin/bash
######################################
### HERBSTLUFT COLORSCHEME SETTING ###
######################################




# CHOOSE COLORSCHEME
dialog --clear --menu "Choose Colorscheme:" 17 40 10 \
	1 "Solarized Dark" \
	2 "Solarized Light" \
	3 "Monokai Dark" \
	4 "Monokai Light" \
	5 "Lucius Dark Low Contrast" \
	6 "Smyck" \
	7 "Google Dark" \
	8 "Google Light" \
	9 "Codeschool Dark" \
	10 "Codeschool Light" \
	11 "Eighties Dark" \
	12 "Eighties Light" \
	13 "Londontube Dark" \
	14 "Londontube Light" \
	15 "Ocean Dark" \
	16 "Ocean Light" \
	17 "Paraiso Dark" \
	18 "Paraiso Light" \
	19 "Railscasts Dark" \
	20 "Railscasts Light" \
	21 "Tomorrow Dark" \
	22 "Tomorrow Light" \
	23 "Twilight Dark" \
	24 "Twilight Light" \
	2>/tmp/temp

input=$(cat /tmp/temp)
rm -f /tmp/temp

case $input in
	"1") source $HOME/.config/herbstluftwm/colorschemes/solarized-dark.sh;;
	"2") source $HOME/.config/herbstluftwm/colorschemes/solarized-light.sh;;
	"3") source $HOME/.config/herbstluftwm/colorschemes/monokai-dark.sh;;
	"4") source $HOME/.config/herbstluftwm/colorschemes/monokai-light.sh;;
	"5") source $HOME/.config/herbstluftwm/colorschemes/lucius-dark-low-contrast.sh;;
	"6") source $HOME/.config/herbstluftwm/colorschemes/smyck.sh;;
	"7") source $HOME/.config/herbstluftwm/colorschemes/google-dark.sh;;
	"8") source $HOME/.config/herbstluftwm/colorschemes/google-ligh.sh;;
	"9") source $HOME/.config/herbstluftwm/colorschemes/codeschool-dark.sh;;
	"10") source $HOME/.config/herbstluftwm/colorschemes/codeschool-light.sh;;
	"11") source $HOME/.config/herbstluftwm/colorschemes/eighties-dark.sh;;
	"12") source $HOME/.config/herbstluftwm/colorschemes/eighties-light.sh;;
	"13") source $HOME/.config/herbstluftwm/colorschemes/londontube-dark.sh;;
	"14") source $HOME/.config/herbstluftwm/colorschemes/londontube-light.sh;;
	"15") source $HOME/.config/herbstluftwm/colorschemes/ocean-dark.sh;;
	"16") source $HOME/.config/herbstluftwm/colorschemes/ocean-light.sh;;
	"17") source $HOME/.config/herbstluftwm/colorschemes/paraiso-dark.sh;;
	"18") source $HOME/.config/herbstluftwm/colorschemes/paraiso-light.sh;;
	"19") source $HOME/.config/herbstluftwm/colorschemes/railscasts-dark.sh;;
	"20") source $HOME/.config/herbstluftwm/colorschemes/railscasts-light.sh;;
	"21") source $HOME/.config/herbstluftwm/colorschemes/tomorrow-dark.sh;;
	"22") source $HOME/.config/herbstluftwm/colorschemes/tomorrow-light.sh;;
	"23") source $HOME/.config/herbstluftwm/colorschemes/twilight-dark.sh;;
	"24") source $HOME/.config/herbstluftwm/colorschemes/twilight-light.sh;;

	*);;
esac


# SET IN XRESOURCES
echo "!###############################
!## COLORS SET BY HERBSTLUFT ###
!###############################




*background: $COLORBACKGROUND
*foreground: $COLORFOREGROUND
*cursorColor: $COLORCURSOR
*color0: $COLOR0
*color1: $COLOR1
*color2: $COLOR2
*color3: $COLOR3
*color4: $COLOR4
*color5: $COLOR5
*color6: $COLOR6
*color7: $COLOR7
*color8: $COLOR8
*color9: $COLOR9
*color10: $COLOR10
*color11: $COLOR11
*color12: $COLOR12
*color13: $COLOR13
*color14: $COLOR14
*color15: $COLOR15" > $HOME/.Xresources.d/colors

xrdb -I$HOME ~/.Xresources


# SET IN PANEL-THEME

