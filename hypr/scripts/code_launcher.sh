#!/usr/bin/bash

FOLDER=$(ls -ld ~/.config/ ~/.config/*/ ~/Documents/code/ ~/Documents/code/*/ | awk '{print $9,$10}' | wofi --show dmenu)
FOLDER=$(echo "$FOLDER" | sed 's/^[ \t]*//;s/[ \t]*$//')
FOLDER=$(echo "$FOLDER" | sed "s/\([A-Za-z]\+\s[A-Za-z]\+\)/'\1'/g")
echo $FOLDER

if [[ ${#FOLDER} -gt 4 ]] ; then
    echo "Valid Folder"
    PROG=$(echo -e "open\ncode\ncreate folder" | wofi --show dmenu )
    echo "$PROG"
    if [ "$PROG" = "create folder" ] ; then
        FNAME=$(echo "" | wofi --show dmenu)
        if [[ ${#FNAME} -gt 0 ]] ; then
            SESSION="$FOLDER$FNAME/"
            SESSION="${SESSION//./_}"
            SESSION=$(echo "$SESSION" | sed 's/^[ \t]*//;s/[ \t]*$//')
            gnome-terminal -- $SHELL -c " cd $FOLDER; mkdir $FNAME; cd $FNAME; tmux new -s $SESSION; exec $SHELL"
        fi
    else 
        if [ "$PROG" = "code" ] ; then
            cd $FOLDER
            code .
        else
            if [ "$PROG" = "open" ] ; then
                SESSION="${FOLDER//./_}"
                SESSION=$(echo "$SESSION" | sed 's/^[ \t]*//;s/[ \t]*$//')
                SESSIONS=$(tmux list-session)
                FOUND=$(echo "$SESSIONS" | grep "$SESSION:")
                if [[ ${#FOUND} -gt 0 ]] ; then
                    echo "FOUND $SESSION:"
                    gnome-terminal -- $SHELL -c "cd $FOLDER; tmux attach -t $SESSION; exec $SHELL"&
                else
                    echo "NOT FOUND $SESSION:"
                    gnome-terminal -- $SHELL -c "cd $FOLDER; tmux new -s $SESSION; exec $SHELL"&
                fi
            fi
        fi
    fi
else
    echo "PASS"
fi
