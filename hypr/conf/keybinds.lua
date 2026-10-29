-- variables
local mainMod     = "SUPER"
local terminal    = "kitty"
local browser     = "firefox"
local menu        = "wofi --show drun"
local code        = "code"
local fileManager = "yazi"

-- env vars 
hl.env("browser", browser)
hl.env("menu", menu)
hl.env("max_volume", "3")
hl.env("code", code)
hl.env("fileManager", fileManager)

-- locking
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock --immediate"), { locked = true })

-- launch apps
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + Q", function()
    hl.dispatch(hl.dsp.window.close())
    hl.exec_cmd("~/.config/hypr/scripts/workspace_remove.sh")
end)
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload; killall waybar && waybar &"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(code))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(terminal .. " -e " .. fileManager))

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(
    [[cliphist list | wofi --dmenu --pre-display-cmd "echo '%s' | cut -f 2" | cliphist decode | wl-copy]]
))

-- screenshot
hl.bind(mainMod .. " + P",          hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + SHIFT + P",  hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + CTRL + P",   hl.dsp.exec_cmd("hyprshot -m window"))

-- gestures
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })

-- windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- laptop settings
-- Audio (PulseAudio) and brightness
local held = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), held)
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), held)
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), held)
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), held)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), held)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), held)

-- workspaces
for i = 1, 10 do
    local key = i % 10 -- workspace 10 is on key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }), { locked = true })
end
