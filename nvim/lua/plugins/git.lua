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
						text = "+",
					},
					change = {
						text = "•",
					},
					delete = {
						text = "-",
					},
					topdelete = {
						text = "‾",
					},
					changedelete = {
						text = "~",
					},
				},
				numhl = true,
                linehl = false,
                word_diff = false,
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
