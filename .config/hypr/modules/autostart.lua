hl.on("hyprland.start", function()
    -- Apps
    hl.exec_cmd("brave-origin")
    hl.exec_cmd("equibop")
    hl.exec_cmd("steam")

    -- Services
    hl.exec_cmd("systemctl --user start hyprpolkitagent")  -- Authentication agent
    hl.exec_cmd("wl-paste --watch cliphist store")         -- Clipboard manager
    hl.exec_cmd("systemctl --user start opentabletdriver") -- Tablet driver
    hl.exec_cmd("awww-daemon")                             -- Wallpaper daemon

    -- Shell
    hl.exec_cmd("waybar") -- Bar
end)
