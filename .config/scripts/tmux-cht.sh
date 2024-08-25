#!/usr/bin/env bash

# Select language or command from the list using fzf
selected=$(cat ~/.config/tmux/.tmux-cht-languages ~/.config/tmux/.tmux-cht-command | fzf)

# Exit if no selection is made
if [[ -z "$selected" ]]; then
    exit 0
fi

# Prompt for the query
read -p "Enter Query: " query

# Replace spaces with plus signs for query URL encoding
encoded_query=$(echo "$query" | tr ' ' '+')

# Define a function to remove specific ANSI escape codes
strip_ansi() {
    sed -r "s/\x1b\[[0-9;]*m//g"
}

# Check if the selected item is in the languages file
if grep -qs "$selected" ~/.config/tmux/.tmux-cht-languages; then
    # Open a new tmux window, run the curl command, pipe to less with -R to handle color
    tmux new-window bash -c "curl -s cht.sh/$selected/$encoded_query | less -R"
else
    # For commands, open a new tmux window, pipe output to less with -R
    tmux new-window bash -c "curl -s cht.sh/$selected~$query | less -R"
fi

