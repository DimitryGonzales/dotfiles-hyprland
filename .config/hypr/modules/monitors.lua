-- General
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1
})

-- Main
hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1
})

-- Secondary
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "-1920x0",
    scale    = 1
})
