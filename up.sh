#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tmux"
LAYOUT_FILE="${TMUX_LAYOUT_FILE:-$CONFIG_DIR/layouts/default}"

TARGET_DIR="${1:-$PWD}"

if ! TARGET_DIR="$(realpath -e -- "$TARGET_DIR")" ||
   [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: invalid directory: $TARGET_DIR" >&2
    exit 1
fi

if [[ -z "${TMUX:-}" ]]; then
    echo "Error: up must be executed inside tmux" >&2
    exit 1
fi

create_config() {
    local count
    local layout
    local tmp_file

    echo "No tmux layout configuration found."
    echo

    while true; do
        read -r -p "Number of panes: " count

        if [[ "$count" =~ ^[1-9][0-9]*$ ]]; then
            break
        fi

        echo "Please enter a positive integer."
    done

    echo
    read -r -p "Tmux layout: " layout

    mkdir -p "$(dirname "$LAYOUT_FILE")"

    tmp_file="${LAYOUT_FILE}.tmp.$$"

    {
        echo "PANE_COUNT=$count"
        echo "LAYOUT=$layout"
    } > "$tmp_file"

    chmod 600 "$tmp_file"
    mv "$tmp_file" "$LAYOUT_FILE"

    echo "Configuration saved: $LAYOUT_FILE"
    echo
}

if [[ ! -f "$LAYOUT_FILE" ]]; then
    if [[ ! -t 0 ]]; then
        echo "Error: configuration missing and stdin is not interactive." >&2
        exit 1
    fi

    create_config
fi

PANE_COUNT=""
LAYOUT=""

while IFS='=' read -r key value; do
    case "$key" in
        PANE_COUNT) PANE_COUNT="$value" ;;
        LAYOUT) LAYOUT="$value" ;;
    esac
done < "$LAYOUT_FILE"

WINDOW_NAME="$(basename "$TARGET_DIR")"

NEW_WINDOW="$(tmux new-window \
    -n "$WINDOW_NAME" \
    -c "$TARGET_DIR" \
    -P \
    -F '#{window_id}')"

for ((i = 1; i < PANE_COUNT; i++)); do
    tmux split-window \
        -t "$NEW_WINDOW" \
        -c "$TARGET_DIR" \
        -d
done

tmux select-layout \
    -t "$NEW_WINDOW" \
    "$LAYOUT"

tmux select-window -t "$NEW_WINDOW"
