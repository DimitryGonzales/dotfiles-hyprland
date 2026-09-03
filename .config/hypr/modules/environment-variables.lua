-- Qt variables
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")     -- Disable window decoration
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR",         "1")     -- Enable automatic scaling
hl.env("QT_QPA_PLATFORMTHEME",                "qt6ct") -- Set qt6ct as theme source

-- Theming related variables
hl.env("XCURSOR_SIZE",  "24")                    -- Set cursor size
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic") -- Set cursor theme

-- Toolkit backend variables
hl.env("CLUTTER_BACKEND", "wayland")       -- Set Clutter backend to Wayland
hl.env("GDK_BACKEND",     "wayland,x11,*") -- Set GTK backend to Wayland > X11 > Other
hl.env("QT_QPA_PLATFORM", "wayland;xcb")   -- Set Qt to Wayland > X11
hl.env("SDL_VIDEODRIVER", "wayland")       -- Set SDL2 backend to Wayland

-- XDG specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland") -- Set current desktop
hl.env("XDG_SESSION_DESKTOP", "Hyprland") -- Set session desktop
hl.env("XDG_SESSION_TYPE",    "wayland")  -- Set session type
