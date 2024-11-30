return {
	{ "onsails/lspkind-nvim" },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	--{ "rafamadriz/friendly-snippets" },

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
		},
		config = function()
			local luasnip = require("luasnip")
			local cmp_action = require("lsp-zero").cmp_action()
			local lspkind = require("lspkind")
			local cmp = require("cmp")

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
				-- REQUIRED: Load snippet enginge
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = false }), -- `Enter` key to confirm completion
					["<C-Space>"] = cmp.mapping.complete(), -- Ctrl+Space to trigger completion menu
					["<C-p>"] = cmp.mapping.select_prev_item(), -- Prev
					["<C-n>"] = cmp.mapping.select_next_item(), -- Next
					["<C-f>"] = cmp_action.luasnip_jump_forward(), -- Navigate between snippet placeholder
					["<C-b>"] = cmp_action.luasnip_jump_backward(), -- Navigate between snippet placeholder
					["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Scroll up and down in the completion documentation
					["<C-d>"] = cmp.mapping.scroll_docs(4), -- Scroll up and down in the completion documentation
					-- Tab mappings
					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end,
					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end,
				}),
				-- Completion settings
				completion = {
					completeopt = "menu, menuone",
					keyword_length = 1,
				},
				experimental = {
					ghost_text = true,
				},
				window = {
					documentation = {
						border = { "", "", "", "", "", "", "", "" },
					},
				},
				sources = {
					{ name = "cmp-nvim-lua" },
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					--{ name = "nvim_lsp_signature_help" },
					{ name = "buffer" },
					{ name = "path" },
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text", -- show only symbol annotations
						maxwidth = 50,
						ellipsis_char = "...",
						before = function(entry, vim_item)
							vim_item.kind = lsp_symbols[vim_item.kind]

							vim_item.menu = ({
								nvim_lsp = "[LSP]",
								luasnip = "[LuaSnip]",
								nvim_lua = "[Lua]",
								path = "[Path]",
								buffer = "[Buffer]",
								emoji = "[Emoji]",
							})[entry.source.name]

							return vim_item
						end,
					}),
				},
			})
		end,
	},
}
