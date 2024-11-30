local function custom_lualine_catpuccin()
	local catppuccin = {}

	return catppuccin
end

return {
	{ "kyazdani42/nvim-web-devicons" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local C = require("catppuccin.palettes").get_palette("mocha")
			local O = require("catppuccin").options
			local transparent_bg = O.transparent_background and "NONE" or C.mantle
			local custom_catpuccin = require("catppuccin.utils.lualine")("mocha")

			-- Customize catppuccin
			custom_catpuccin.normal.a.bg = transparent_bg
			custom_catpuccin.normal.a.fg = C.blue

			require("lualine").setup({
				options = {
					theme = "auto", --custom_catpuccin,
					icons_enabled = true,
					-- component_separators = { left = "|", right = "|" },
					-- section_separators = { left = "|", right = "|" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = {},
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")

			dashboard.section.header.val = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
			}

			alpha.setup(dashboard.opts)
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup()

			vim.diagnostic.config({ virtual_text = false })
		end,
	},
}
