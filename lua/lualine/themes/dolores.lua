local p = require("dolores.palette")
local config = require("dolores.config")

local bg_base = config.options.styles.transparency and "NONE" or p.c2

return {
	normal = {
		a = { bg = p.c14, fg = p.bg, gui = "bold" },
		b = { bg = p.c4, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	insert = {
		a = { bg = p.c12, fg = p.bg, gui = "bold" },
		b = { bg = p.c4, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	visual = {
		a = { bg = p.c15, fg = p.bg, gui = "bold" },
		b = { bg = p.c4, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	replace = {
		a = { bg = p.c11, fg = p.bg, gui = "bold" },
		b = { bg = p.c4, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	command = {
		a = { bg = p.c8, fg = p.bg, gui = "bold" },
		b = { bg = p.c4, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	terminal = {
		a = { bg = p.c14, fg = p.bg, gui = "bold" },
		b = { bg = p.c4, fg = p.text },
		c = { bg = bg_base, fg = p.text },
	},
	inactive = {
		a = { bg = bg_base, fg = p.c6 },
		b = { bg = bg_base, fg = p.c6 },
		c = { bg = bg_base, fg = p.c6 },
	},
}
