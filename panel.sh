#!/bin/bash
###############################
### HERBSTLUFT PANEL CONFIG ###
###############################




# function wrapping the herbstclient command
hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}

# load theme file
source $HOME/.config/herbstluftwm/panel-theme.sh


# GEOMETRY

# get monitor dimensions
monitor=${1:-0}
geometry=( $(hc monitor_rect $monitor) )

# set panel dimensions
x=${geometry[0]}
y=${geometry[1]}
w=${geometry[2]}
h=20


# SETTINGS

dzen="dzen2 -x $x -y $y -w $w -h $h -fn $font -ta l -bg $panel_bg -fg $panel_fg"


# FUNCTIONS

#bar() {
#    bar_height=$(echo "$h*$bar_h" | bc)
#    echo $3 | gdbar -w $bar_w -h $bar_height $bar_style -bg ${1} -fg ${2}
#}

function uniq_linebuffered() {
   awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}


# EXECUTION

# leave room for the panel
hc pad $monitor $h

# herbstluftwm event
{
    hc --idle

    kill $childpid

} | tee /dev/stderr | {

    # get tags from herbstluft 
    tags=( $(hc tag_status $monitor) )
    windowtitle=""

# execution
    while true ; do
	# draw tags    
        for i in "${tags[@]}" ; do
            case ${i:0:1} in
                '.')            # tag is empty
                    echo -n "^bg($unused_bg)^fg($unused_fg)"
                    ;;
                ':')            # tag is not empty
                    echo -n "^bg($used_bg)^fg($used_fg)"
                    ;;
                '#')            # currently focused on active monitor
                    echo -n "^bg($active_bg)^fg($active_fg)"
                    ;;
                '+')            # not focused but on active monitor
                    echo -n "^bg($inactive_bg)^fg($inactive_fg)"
                    ;;
                '!')            # urgent tag
                    echo -n "^bg($urgent_bg)^fg($urgent_fg)"
                    ;;
                *)
                    echo -n "^bg()^fg()"
                    ;;
            esac

            # clickable tags 
            echo -n "^ca(1,\"herbstclient\" "
            echo -n "focus_monitor \"$monitor\" && "
            echo -n "\"${herbstclient_command[@]:-herbstclient}\" "
            echo -n "use \"${i:1}\") ${i:1} ^ca()"
        done

        echo -n "$sep"
        
        # draw window title
        echo -n "^bg($title_bg)^fg($title_fg) ${windowtitle//^/^^}"


# RIGHT PART OF BAR

        # clock



	# finish output
	width=$(($width+$(textwidth "$font" "$text"))) 

        echo -n "^pa($(($w - $width)))$right"
        echo


# HANDLE EVENTS
        
	# wait for next event
        read line || break
        cmd=( $line )
        # find out event origin
        echo "Command: ${cmd[0]}" >&2
        case "${cmd[0]}" in
            tag*)
                # reset tags
                tags=( $(hc tag_status $monitor) )
                ;;
            quit_panel)
                exit
                ;;
            reload)
                exit
               ;;
            focus_changed|window_title_changed)
                windowtitle="${cmd[@]:2}"
                ;;
        esac
    done

# PIPE RESULT TO DZEN
} 2> /dev/null | $dzen 
