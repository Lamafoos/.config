return {
	-- { "onsails/lspkind-nvim" },
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	version = "v2.*",
	-- 	build = "make install_jsregexp",
	-- 	dependencies = { "rafamadriz/friendly-snippets" },
	-- 	config = function()
	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	-- 	end,
	-- },
	{
		"garymjr/nvim-snippets",
		opts = {
			friendly_snippets = true,
		},
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			-- local cmp_action = require("lsp-zero").cmp_action()
			-- local lspkind = require("lspkind")

			local lsp_symbols = {
				Text = "   (Text) ",
				Method = "   (Method)",
				Function = "   (Function)",
				Constructor = "   (Constructor)",
				Field = " ﴲ  (Field)",
				Variable = "[] (Variable)",
				Class = "   (Class)",
				Interface = " ﰮ  (Interface)",
				Module = "   (Module)",
				Property = " 襁 (Property)",
				Unit = "   (Unit)",
				Value = "   (Value)",
				Enum = " 練 (Enum)",
				Keyword = "   (Keyword)",
				Snippet = "   (Snippet)",
				Color = "   (Color)",
				File = "   (File)",
				Reference = "   (Reference)",
				Folder = "   (Folder)",
				EnumMember = "   (EnumMember)",
				Constant = " ﲀ  (Constant)",
				Struct = " ﳤ  (Struct)",
				Event = "   (Event)",
				Operator = "   (Operator)",
				TypeParameter = "   (TypeParameter)",
			}

			cmp.setup({
				-- REQUIRED: Load snippet engine
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- `Enter` key to confirm completion
					["<C-Space>"] = cmp.mapping.complete(), -- Ctrl+Space to trigger completion menu
					["<C-p>"] = cmp.mapping.select_prev_item(), -- Prev
					["<C-n>"] = cmp.mapping.select_next_item(), -- Next
					["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll up and down in the completion documentation
					["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll up and down in the completion documentation
					-- Tab mappings
					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
                            -- cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
						else
							fallback()
						end
					end,
					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
                            -- cmp.map({ "snippet_backward"}, fallback)()
						else
							fallback()
						end
					end,
				}),
				-- Completion settings
				completion = {
					completeopt = "menu,menuone,noinsert",
					-- keyword_length = 1,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "snippets" },
					-- { name = "luasnip" },
					-- { name = "cmp-nvim-lua" },
					-- { name = "nvim_lsp_signature_help" },
					{ name = "buffer" },
					{ name = "path" },
				},
				experimental = {
					-- only show ghost text when we show ai completions
					ghost_text = vim.g.ai_cmp and {
						hl_group = "CmpGhostText",
					} or false,
				},
				-- formatting = {
				-- 	format = lspkind.cmp_format({
				-- 		mode = "symbol_text", -- show only symbol annotations
				-- 		maxwidth = 50,
				-- 		ellipsis_char = "...",
				-- 		before = function(entry, vim_item)
				-- 			vim_item.kind = lsp_symbols[vim_item.kind]
				--
				-- 			vim_item.menu = ({
				-- 				nvim_lsp = "[LSP]",
				-- 				luasnip = "[LuaSnip]",
				-- 				nvim_lua = "[Lua]",
				-- 				path = "[Path]",
				-- 				buffer = "[Buffer]",
				-- 				emoji = "[Emoji]",
				-- 			})[entry.source.name]
				--
				-- 			return vim_item
				-- 		end,
				-- 	}),
				-- },
			})
		end,
	},
}
