hl.config({
    decoration = {
        rounding = 20,
        rounding_power = 3.0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
        },

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
    },

    general = {
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border = { colors = { "rgb(34,178,191)", "rgb(149,142,22)" } },
        },
    },
})
