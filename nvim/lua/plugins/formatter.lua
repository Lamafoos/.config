return {
	"stevearc/conform.nvim",
	opts = {},
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Conform (Format)",
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				rust = { "rustfmt" },
			},
		})
		--	vim.api.nvim_create_autocmd("BufWritePre", {
		--		pattern = "*",
		--		callback = function(args)
		--			require("conform").format({ bufnr = args.buf })
		--		end,
		--	})
	end,
}
