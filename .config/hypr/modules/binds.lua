-- Apps
hl.bind("SUPER + E",                hl.dsp.exec_cmd("nautilus"))  -- Launch file manager
hl.bind("CONTROL + SHIFT + ESCAPE", hl.dsp.exec_cmd("resources")) -- Launch system monitor
hl.bind("SUPER + RETURN",           hl.dsp.exec_cmd("ghostty"))   -- Launch terminal

-- Audio
hl.bind("SUPER + MINUS", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),        { repeating = true, locked = true }) -- -5% sink volume
hl.bind("SUPER + EQUAL", hl.dsp.exec_cmd("wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true }) -- +5% sink volume
hl.bind("SUPER + M",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),       { locked = true })                   -- Toggle sink mute

hl.bind("SUPER + SHIFT + MINUS", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-"),        { repeating = true, locked = true }) -- -5% source volume
hl.bind("SUPER + SHIFT + EQUAL", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 5%+"), { repeating = true, locked = true }) -- +5% source volume
hl.bind("SUPER + SHIFT + M",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),       { locked = true })                   -- Toggle source mute

hl.bind("SUPER + mouse:275", hl.dsp.exec_cmd("equibop --toggle-mic"),    { locked = true, mouse = true }) -- Toggle equipop microphone status
hl.bind("SUPER + mouse:276", hl.dsp.exec_cmd("equibop --toggle-deafen"), { locked = true, mouse = true }) -- Toggle equipop deafen status

-- Group
hl.bind("SUPER + G",         hl.dsp.group.toggle())                    -- Toggle group
hl.bind("SUPER + SHIFT + G", hl.dsp.group.lock({ action = "toggle" })) -- Toggle group lock

-- Player
hl.bind("CONTROL + 7", hl.dsp.exec_cmd("playerctl previous"),   { locked = true }) -- Previous player
hl.bind("CONTROL + 8", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- Play/Pause player
hl.bind("CONTROL + 9", hl.dsp.exec_cmd("playerctl next"),       { locked = true }) -- Next player

-- Screenshot
local function screenshot(mode)
    local output_folder = "~/Pictures/screenshots"
    local file_name     = "screenshot_" .. os.date("%Y-%m-%d_%H-%M-%S") .. ".png"

    return "hyprshot -m " .. mode .. " -o " .. output_folder .. " -f " .. file_name .. " -z"
end

hl.bind("SUPER + ESCAPE", function()
    hl.dispatch(hl.dsp.exec_cmd(screenshot("region"))) -- Screenshot region
end)

hl.bind("SUPER + SHIFT + ESCAPE", function()
    hl.dispatch(hl.dsp.exec_cmd(screenshot("window"))) -- Screenshot window
end)

hl.bind("SUPER + ALT + ESCAPE", function()
    hl.dispatch(hl.dsp.exec_cmd(screenshot("output"))) -- Screenshot output
end)

-- Window
hl.bind("SUPER + C", hl.dsp.window.close()) -- Close window

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true }) -- Drag window
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- Resize window

hl.bind("SUPER + F",         hl.dsp.window.float({ action = "toggle" }))      -- Toggle window float
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" })) -- Toggle window fullscreen

-- Shell
hl.bind("SUPER + L",         hl.dsp.exec_cmd("hyprlock"))                             -- Lock screen
hl.bind("SUPER + ALT + B",   hl.dsp.exec_cmd("pkill -SIGUSR2 waybar || waybar"))      -- Restart/start bar
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -anrl")) -- Toggle color picker

hl.bind("SUPER + SPACE",     hl.dsp.exec_cmd("pkill rofi || rofi -show drun -theme-str '* { modi-title: \"Apps\"; } listview { require-input: true; }'"))                     -- Toggle app launcher
hl.bind("SUPER + V",         hl.dsp.exec_cmd("pkill rofi || rofi -show clipboard:~/.config/rofi/scripts/cliphist-rofi-img.sh -theme-str '* { modi-title: \"Clipboard\"; }'")) -- Toggle clipboard
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("pkill rofi || rofi -show emoji -theme-str '* { modi-title: \"Emoji\"; }'"))                                                     -- Toggle emoji picker

hl.bind("SUPER + N",         hl.dsp.exec_cmd("swaync-client -t || swaync"))     -- Toggle/start notification center
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("swaync-client -d || swaync"))     -- Toggle/start notification center do-not-disturb
hl.bind("SUPER + ALT + N",   hl.dsp.exec_cmd("swaync-client -R -rs || swaync")) -- Restart/start notification center

-- Workspace
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i }))       -- Move focus to workspace 1-10
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i })) -- Move window to workspace 1-10
end

hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("Quick"))            -- Toggle special workspace(Quick)
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:Quick" })) -- Move window to special workspace(Quick)
