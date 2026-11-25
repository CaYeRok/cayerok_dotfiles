#!/usr/bin/env bash

# Exit if jq or hyprctl is missing
command -v jq >/dev/null 2>&1 || { echo "jq not installed"; exit 1; }
command -v hyprctl >/dev/null 2>&1 || { echo "hyprctl not found"; exit 1; }

# Get current workspace ID
WS_ID=$(hyprctl activeworkspace -j | jq -r '.id')

# Rename workspace to just its number
hyprctl eval "hl.dispatch(hl.dsp.workspace.rename({ workspace = $WS_ID, name = \"$WS_ID\" }))"
