local function custom_lualine_catpuccin()
	local C = require("catppuccin.palettes").get_palette("mocha")
	local O = require("catppuccin").options
	local catppuccin = {}

	local transparent_bg = "NONE"

	catppuccin.normal = {
		a = { bg = transparent_bg, fg = C.blue },
		b = { bg = transparent_bg, fg = C.text },
		c = { bg = transparent_bg, fg = C.text },
		z = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.insert = {
		a = { bg = transparent_bg, fg = C.green },
		b = { bg = transparent_bg, fg = C.text },
		c = { bg = transparent_bg, fg = C.text },
		z = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.terminal = {
		a = { bg = transparent_bg, fg = C.green },
		b = { bg = transparent_bg, fg = C.text },
		c = { bg = transparent_bg, fg = C.text },
		z = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.command = {
		a = { bg = transparent_bg, fg = C.peach },
		b = { bg = transparent_bg, fg = C.text },
		c = { bg = transparent_bg, fg = C.text },
		z = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.visual = {
		a = { bg = transparent_bg, fg = C.mauve },
		b = { bg = transparent_bg, fg = C.text },
		c = { bg = transparent_bg, fg = C.text },
		z = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.replace = {
		a = { bg = transparent_bg, fg = C.red },
		b = { bg = transparent_bg, fg = C.text },
		c = { bg = transparent_bg, fg = C.text },
		z = { bg = transparent_bg, fg = C.text },
	}

	catppuccin.inactive = {
		a = { bg = transparent_bg, fg = C.blue },
		b = { bg = transparent_bg, fg = C.text },
		c = { bg = transparent_bg, fg = C.text },
		z = { bg = transparent_bg, fg = C.text },
	}

	return catppuccin
end

return {
	{
		"echasnovski/mini.icons",
		lazy = true,
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = { harpoon = true, blink_cmp = true, noice = true },
		},
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = custom_lualine_catpuccin, -- "auto",
					icons_enabled = true,
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "encoding", "filetype", "filename" },
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
		"folke/noice.nvim",
		event = "VeryLazy",
		-- opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup(require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = false, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			}))
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "classic",
			})

			vim.diagnostic.config({ virtual_text = false })
		end,
	},
}
