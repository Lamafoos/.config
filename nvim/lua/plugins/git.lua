return {
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
					virt_text_pos = "right_align",
					delay = 200,
				},
			})
		end,
	},
}
