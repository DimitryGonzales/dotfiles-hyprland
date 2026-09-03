hl.curve("ease-in-out", { type = "bezier", points = { { 0.5, 0 }, { 0.5, 1 } } }) -- Define symmetrical ease-in-out Bézier curve

hl.animation({ leaf = "global",           enabled = true, speed = 2, bezier = "ease-in-out" })                      -- Set all animations to 200ms ease-in-out
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "ease-in-out", style = "slidevert" }) -- Set special workspace animation to slide vertically
