return {
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local key_set = vim.keymap.set
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")

			key_set("n", "<leader>pf", builtin.find_files, {})
            key_set("n", "<leader>ps", builtin.live_grep, {})
			key_set("n", "<C-p>", builtin.git_files, {})
			key_set("n", "<C-b>", builtin.buffers, {})

			telescope.setup({
				defaults = {
					--     initial_mode = "insert",
					--     file_ignore_patterns = { ".git/", "node_modules/" },
					--     sorting_strategy = "ascending",
					color_devicons = true,
					--     -- path_display = "truncate",
					-- border = {},
					--     preview = {
					--       timeout = 500,
					--     },
                    path_display = {"smart"},
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				--   extensions = {
				--     fzf = {
				--       fuzzy = true,
				--       override_generic_sorter = true,
				--       override_file_sorter = true,
				--       case_mode = "smart_case",
				--     },

				file_browser = {
					files = true,
					depth = false,
					hidden = true,
					respect_gitignore = false,
					-- mappings = {
					--   ["n"] = {
					--     ["<C-c>"] = fb_actions.create,
					--     ["<C-d>"] = fb_actions.remove,
					--     ["<C-m>"] = fb_actions.move,
					--     ["<C-h>"] = fb_actions.goto_home_dir
					--   }
					-- }
				},
				--   },

				path_display = { "truncate" },
				set_env = { ["COLORTERM"] = "truecolor" },
			})

			telescope.load_extension("file_browser")
			-- telescope.load_extension('fzf')
		end,
	},
}
