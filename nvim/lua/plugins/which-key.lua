return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")

		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
}
