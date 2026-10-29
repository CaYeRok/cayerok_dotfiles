local function rename_workspaces()
    hl.exec_cmd("~/.config/hypr/scripts/workspace_rename.sh")
end

hl.on("hyprland.start", function()
    hl.exec_cmd("cliphist store &")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper -c ~/.config/hypr/hyprpaper.conf")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("swaync")
    hl.exec_cmd("pipewire")
    hl.exec_cmd("hyprpolkitagent")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")   -- stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store")  -- stores only image data

    rename_workspaces()
end)

-- `exec` (without -once) ran on every config reload
hl.on("config.reloaded", rename_workspaces)
