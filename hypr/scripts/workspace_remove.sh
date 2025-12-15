#!/usr/bin/env bash

# Exit if hyprctl is missing
command -v hyprctl >/dev/null 2>&1 || { echo "hyprctl not found"; exit 1; }

# Get current workspace ID
WS_ID=$(hyprctl activewindow -j | jq -r '.workspace.id')

# Rename workspace to just its number (or empty string)
hyprctl dispatch renameworkspace "$WS_ID $WS_ID"
