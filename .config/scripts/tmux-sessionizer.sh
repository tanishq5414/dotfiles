#!/usr/bin/env bash

exec > >(tee -a /tmp/tmux-sessionizer-debug.log) 2>&1  # Log all output and errors

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected=$(find "$HOME/dev/mittarv" "$HOME/dev/programming" "$HOME" "$HOME/hdd" -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr '.' '_')
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux -u new-session -s "$selected_name" -c "$selected" 2>> /tmp/tmux-sessionizer-debug.log
    exit 0
fi

if ! tmux has-session -t="$selected_name" 2> /dev/null; then
    tmux -u new-session -ds "$selected_name" -c "$selected" 2>> /tmp/tmux-sessionizer-debug.log
fi

tmux -u switch-client -t "$selected_name" 2>> /tmp/tmux-sessionizer-debug.log

