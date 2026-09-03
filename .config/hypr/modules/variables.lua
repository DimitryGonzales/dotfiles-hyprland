hl.config({
    general = {
        border_size = 0,

        gaps_in  = 4,
        gaps_out = 8,

        col = {
            inactive_border = primary_container,
            active_border   = primary
        },

        allow_tearing = true
    },

    decoration = {
        rounding = 16,

        dim_special  = 0.5,

        blur = {
            passes = 3
        }
    },

    input = {
        kb_layout  = "us,br",
        kb_variant = ",abnt2",
        kb_options = "grp:alt_shift_toggle",

        accel_profile = "flat"
    },

    group = {
        col = {
            border_active   = primary,
            border_inactive = primary_container,

            border_locked_active   = secondary,
            border_locked_inactive = secondary_container
        },

        groupbar = {
            font_size = 16,

            gradients = true,

            height = 32, -- (font_size=16 + (padding=8 * 2))

            indicator_height = 0,

            gradient_rounding         = 16, -- (height=32 / 2)
            gradient_round_only_edges = false,

            text_color          = on_primary,
            text_color_inactive = on_primary_container,

            text_color_locked_active   = on_secondary,
            text_color_locked_inactive = on_secondary_container,

            col = {
                active   = primary,
                inactive = primary_container,

                locked_active   = secondary,
                locked_inactive = secondary_container
            },

            gaps_in        = 4,
            gaps_out       = 4,
            keep_upper_gap = false
        }
    },

    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,

        font_family = "Inter",

        vrr = 1,

        enable_swallow = true,
        swallow_regex  = "^(com.mitchellh.ghostty)$",

        close_special_on_empty = false
    },

    binds = {
        hide_special_on_workspace_change = true,

        movefocus_cycles_groupfirst = true
    },

    render = {
        direct_scanout = 1
    },

    cursor = {
        no_hardware_cursors = 1,

        enable_hyprcursor = false
    }
})
