#!/usr/bin/env bash

set -euo pipefail

SOURCE_WINDOW="${1:-}"

if [[ -z "$SOURCE_WINDOW" ]]; then
    echo "Usage: create_panes <source-window>"
    exit 1
fi

LAYOUT=$(tmux display-message \
    -t "$SOURCE_WINDOW" \
    -p '#{window_layout}')

PANE_COUNT=$(tmux list-panes \
    -t "$SOURCE_WINDOW" \
    | wc -l)

NEW_WINDOW=$(tmux new-window \
    -c "$HOME" \
    -P \
    -F '#{window_id}')

for ((i = 1; i < PANE_COUNT; i++)); do
    tmux split-window \
        -t "$NEW_WINDOW" \
        -c "$HOME" \
        -d
done

tmux select-layout \
    -t "$NEW_WINDOW" \
    "$LAYOUT"

tmux set-window-option \
    -t "$NEW_WINDOW" \
    synchronize-panes on

tmux select-window -t "$NEW_WINDOW"
