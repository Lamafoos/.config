return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local lsp_zero = require("lsp-zero")

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"cssls",
					"html",
					"eslint",
					"rust_analyzer",
					"volar",
					"eslint",
				},
				handlers = {
					lsp_zero.default_setup,
					rust_analyzer = lsp_zero.noop,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })

				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					vim.keymap.set(
						"n",
						"<leader>tih",
						"<cmd>lua lsp.inlay_hint.enable(0, not lsp.inlay_hint.is_enabled()) end)<CR>",
						{ silent = true }
					)
				end
			end)

			-- lsp_zero.set_server_config({
			-- 	on_init = function(client)
			-- 		vim.notify(client.name .. ": Language Server successfully started!", "info")
			-- 	end,
			-- })

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "»",
					},
				},
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		ft = { "rust" },
		config = function()
			local lsp_zero = require("lsp-zero")

			vim.g.rustaceanvim = {
				server = {
					capabilities = lsp_zero.get_capabilities(),
					on_init = function(client, bufnr)
						vim.notify(client.name .. ": Language Server successfully started!", "info")
					end,
					default_settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				},
			}
		end,
	},
}
