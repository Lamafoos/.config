local function find_nearest_node_modules_dir()
	-- current buffer dir
	local current_dir = vim.fn.expand("%:p:h")
	while current_dir ~= "/" do
		if vim.fn.isdirectory(current_dir .. "/node_modules") == 1 then
			return current_dir
		end
		current_dir = vim.fn.fnamemodify(current_dir, ":h")
	end
	return nil
end

return {
	"mfussenegger/nvim-lint",
	-- keys = {
	-- 	{
	-- 		"<leader>l",
	-- 		function()
	-- 			local lint = require("lint")
	-- 			local ft = vim.bo.filetype
	-- 			local types_to_check =
	-- 				{ "javascript", "typescript", "javascriptreact", "typescriptreact", "css", "scss" }
	--
	-- 			if not vim.tbl_contains(types_to_check, ft) then
	-- 				lint.try_lint()
	-- 				return
	-- 			end
	--
	-- 			local original_cwd = vim.fn.getcwd()
	-- 			local node_modules_dir = find_nearest_node_modules_dir()
	--
	-- 			if node_modules_dir then
	-- 				vim.cmd("cd " .. node_modules_dir)
	-- 			end
	--
	-- 			lint.try_lint()
	-- 			vim.cmd("cd " .. original_cwd)
	-- 		end,
	-- 		mode = "",
	-- 		desc = "Lint buffer",
	-- 	},
	-- },
	opts = {
		events = {
			"BufWritePost",
			"BufReadPost",
			"InsertLeave",
		},
		linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			css = { "stylelint" },
			scss = { "stylelint" },
			twig = { "twigcs" },
			dockerfile = { "hadolint" },
		},
		linters = {
			-- Example of using selene only when a selene.toml file is present
			-- stylelint = function(ctx)
			-- 	return vim.fs.find({ "stylelintrc.json" }, { path = ctx.filename, upward = true })[1]
			-- end,
		},
	},
	config = function(_, opts)
		local lint = require("lint")
		vim.env.ESLINT_D_PPID = vim.fn.getpid()
		lint.linters_by_ft = opts.linters_by_ft

		vim.api.nvim_create_autocmd(opts.events, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = function()
				local ft = vim.bo.filetype
				local types_to_check =
					{ "javascript", "typescript", "javascriptreact", "typescriptreact", "css", "scss" }

				if not vim.tbl_contains(types_to_check, ft) then
					lint.try_lint()
					return
				end

				local original_cwd = vim.fn.getcwd()
				local node_modules_dir = find_nearest_node_modules_dir()

				if node_modules_dir then
					vim.cmd("cd " .. node_modules_dir)
				end

				lint.try_lint()
				vim.cmd("cd " .. original_cwd)
			end,
		})
	end,
}
