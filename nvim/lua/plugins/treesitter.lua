return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	keys = {
		{ "<leader>t", ":NvimTreeToggle<CR>", desc = "NvimTreeToggle" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"html",
				"javascript",
				"typescript",
				"rust",
				"twig",
				"tsx",
			},
			highlight = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
