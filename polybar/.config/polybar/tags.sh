#!/usr/bin/env bash

# Multi monitor support. Needs MONITOR environment variable to be set for each instance of polybar
# If MONITOR environment variable is not set this will default to monitor 0
# Check https://github.com/polybar/polybar/issues/763
MON_IDX="0"
mapfile -t MONITOR_LIST < <(polybar --list-monitors | cut -d":" -f1)
for (( i=0; i<$((${#MONITOR_LIST[@]})); i++ )); do
  [[ ${MONITOR_LIST[${i}]} == "$MONITOR" ]] && MON_IDX="$i"
done;

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status "${MON_IDX}")"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them according to that prefix
                case ${i:0:1} in
                    '.')
                        # the tag is empty
						# echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:}%{B#4c594c} ${i:1} %{B-}%{A}"
						echo "%{F#4C594C}  %{F-}"
                        ;;
                    ':')
                        # the tag is not empty
						# echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:}%{B#354535} ${i:1} %{B-}%{A}"
						echo "%{F#4C594C}  %{F-}"
                        ;;
                    '+')
                        # the tag is viewed on the specified MONITOR, but this monitor is not focused.
                        ;;
                    '#')
                        # the tag is viewed on the specified MONITOR and it is focused.
						# echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:}%{B#738f54} ${i:1} %{B-}%{A}"
						echo "%{F#738F54}  %{F-}"
                        ;;
                    '-')
                        # the tag is viewed on a different MONITOR, but this monitor is not focused.
                        ;;
                    '%')
                        # the tag is viewed on a different MONITOR and it is focused.
                        ;;
                    '!')
                        # urgent window
						# echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:}%{B#D16969} ${i:1} %{B-}%{A}"
						echo "%{F#D16969}  %{F-}"
                        ;;
                esac

                # focus the monitor of the current bar before switching tags
                # echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:}  ${i:1}  %{A -u -o F- B-}"
            done

            # reset foreground and background color to default
            echo "%{F-}%{B-}"
        } | tr -d "\n"

    echo

    # wait for next event from herbstclient --idle
    read -r || break
done
} 2>/dev/null

