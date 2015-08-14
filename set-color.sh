#!/bin/bash
######################################
### HERBSTLUFT COLORSCHEME SETTING ###
######################################




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

