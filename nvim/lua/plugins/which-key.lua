return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
}
