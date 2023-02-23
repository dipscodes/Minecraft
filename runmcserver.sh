#!/bin/bash

tmux new-session -s "java" -d
tmux send-keys -t "java" "cd /home/mcadmin/LyadhCraft" Enter
tmux send-keys -t "java" "java -Xmx6G -jar ./server.jar nogui" Enter
