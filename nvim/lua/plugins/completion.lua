return {
	{
		"saghen/blink.cmp",
		version = "v0.*",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = "rafamadriz/friendly-snippets",
		opts = {
			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			cmdline = {
				-- sources = {
				-- 	default = { "buffer", "lsp", "path", "snippets" },
				-- 	-- cmdline = {}, -- dont show in cmd
				-- },
				keymap = {
					["<C-CR>"] = { "accept_and_enter", "fallback" },
				},
			},
			signature = {
				enabled = false,
				window = {
					border = "rounded",
				},
			},
			completion = {
				accept = {
					-- experimental auto-brackets support
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					border = "rounded",
					draw = {
						treesitter = { "lsp" },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = {
						border = "rounded",
					},
				},
				-- ghost_text = {
				-- 	enabled = vim.g.ai_cmp,
				-- },
			},
		},
		opts_extend = { "sources.default" },
	},
}
