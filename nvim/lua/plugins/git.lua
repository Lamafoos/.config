return {
	{ "tpope/vim-fugitive" },
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			vim.keymap.set("n", "<leader>G", [[:LazyGit<CR>]])
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = {
						hl = "DiffAdd",
						text = "+",
						numhl = "GitSignsAddNr",
					},
					change = {
						hl = "DiffChange",
						text = "•",
						numhl = "GitSignsChangeNr",
					},
					delete = {
						hl = "DiffDelete",
						text = "-",
						numhl = "GitSignsDeleteNr",
					},
					topdelete = {
						hl = "DiffDelete",
						text = "‾",
						numhl = "GitSignsDeleteNr",
					},
					changedelete = {
						hl = "DiffChange",
						text = "~",
						numhl = "GitSignsChangeNr",
					},
				},
				numhl = true,
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 200,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
			})
		end,
	},
}
