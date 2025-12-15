#!/usr/bin/env bash

# Exit if jq or hyprctl is missing
command -v jq >/dev/null 2>&1 || { echo "jq not installed"; exit 1; }
command -v hyprctl >/dev/null 2>&1 || { echo "hyprctl not found"; exit 1; }

# Get current workspace ID
WS_ID=$(hyprctl activewindow -j | jq -r '.workspace.id')

# Focus the master window
hyprctl dispatch layoutmsg focusmaster master

# Get the class of the master window
MASTER_CLASS=$(hyprctl activewindow -j | jq -r '.class')
if [[ -z "$MASTER_CLASS" ]]; then
    NAME="$WS_ID"
else
    NAME="$(echo "$MASTER_CLASS" | tr '[:upper:]' '[:lower:]')-$WS_ID"
fi
# Rename the workspace
hyprctl dispatch renameworkspace "$WS_ID $NAME"
