-- workspace
hl.workspace_rule({
	workspace = "w[tv1]", 
	gaps_out = 0,
	gaps_in = 0,
	border_size = 0,
	no_rounding = true
})

-- windows

hl.window_rule({
	name = {class = "kitty-opacity" },
	match = {
		class = "kitty"
		},
	opacity = "0.82 override 0.82 override 0.82 override",
})

hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})
