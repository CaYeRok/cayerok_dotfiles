#!/usr/bin/env bash

# Exit if jq or hyprctl is missing
command -v jq >/dev/null 2>&1 || { echo "jq not installed"; exit 1; }
command -v hyprctl >/dev/null 2>&1 || { echo "hyprctl not found"; exit 1; }

# Get current workspace ID
WS_ID=$(hyprctl activeworkspace -j | jq -r '.id')

# Focus the master window
hyprctl eval 'hl.dispatch(hl.dsp.layout("focusmaster master"))'

# Get the class of the master window (empty if there is none)
MASTER_CLASS=$(hyprctl activewindow -j | jq -r '.class // empty')
if [[ -z "$MASTER_CLASS" ]]; then
    NAME="$WS_ID"
else
    NAME="${MASTER_CLASS,,}-$WS_ID"
fi

# Escape backslashes and quotes so the name is safe inside a Lua string
NAME_ESC=${NAME//\\/\\\\}
NAME_ESC=${NAME_ESC//\"/\\\"}

# Rename the workspace
hyprctl eval "hl.dispatch(hl.dsp.workspace.rename({ workspace = $WS_ID, name = \"$NAME_ESC\" }))"
