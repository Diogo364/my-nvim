local gen_spec = require("mini.ai").gen_spec

M = {
	custom_textobjects = {
		c = gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
		F = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		o = gen_spec.treesitter({
			a = { "@conditional.outer", "@loop.outer" },
			i = { "@conditional.inner", "@loop.inner" },
		}),
	},
	mappings = {
		-- Main textobject prefixes
		around = "a",
		inside = "i",

		-- Next/last variants
		around_next = "an",
		inside_next = "in",
		around_last = "al",
		inside_last = "il",

		-- Move cursor to corresponding edge of `a` textobject
		goto_left = "g[",
		goto_right = "g]",
	},

	-- Number of lines within which textobject is searched
	n_lines = 100,

	-- How to search for object (first inside current line, then inside
	-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
	-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
	search_method = "cover_or_next",

	-- Whether to disable showing non-error feedback
	silent = false,
}

return M
