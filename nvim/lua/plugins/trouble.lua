return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	cmd = "Trouble",
	keys = {
		{ "<s-T>", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble" },
	},
}
