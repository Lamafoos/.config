return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = {"stylua"},
                javascript = {"prettierd"},
                typescript = {"prettierd"},
                typescriptreact = {"prettierd"},
                rust = {"rustfmt"},
            };
        });
    end
}
