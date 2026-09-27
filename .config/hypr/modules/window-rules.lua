-- Apps
hl.window_rule({ match = { class = "equibop" },                        workspace = "6" })                    -- Bind Equibop to workspace 6
hl.window_rule({ match = { class = "com.github.th-ch.youtube-music" }, workspace = "7" })                    -- Bind Youtube Music to workspace 7
hl.window_rule({ match = { class = "OpenTabletDriver.UX" },            workspace = "8" })                    -- Bind OpenTabletDriver to workspace 8
hl.window_rule({ match = { class = "steam" },                          workspace = "9 silent" })             -- Bind Steam to workspace 9 silently
hl.window_rule({ match = { class = "brave-origin" },                   workspace = "special:Quick silent" }) -- Bind Brave Origin to special workspace(Quick) silently

-- Games
hl.window_rule({
    name  = "Counter Strike 2",
    match = { class = "cs2" },

    fullscreen = true,
    workspace  = "10"
})

hl.window_rule({
    name  = "Minecraft",
    match = { class = "Minecraft.*" },

    fullscreen = true,
    workspace  = "10"
})

hl.window_rule({
    name  = "osu!",
    match = { class = "osu!" },

    fullscreen = true,
    workspace  = "10"
})

hl.window_rule({
    name  = "Steam apps",
    match = { class = "steam_app_.*" },

    fullscreen = true,
    workspace  = "10"
})

-- General
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" }) -- Suppress maximize events

hl.window_rule({
    name  = "Fix XWayland dragging",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false
    },

    no_focus = true
})

hl.window_rule({
    name  = "Force fullscreen windows in workspace 10 to allow tearing",
    match = {
        fullscreen = true,
        workspace  = "10"
    },

    immediate = true
})

-- Layers
hl.layer_rule({ match = { namespace = "rofi" },                  animation = "slide left" })  -- Set Rofi animation to slide from left
hl.layer_rule({ match = { namespace = "swaync-control-center" }, animation = "slide right" }) -- Set SwayNC animation to slide from right
