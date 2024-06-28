return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>pf", "FzfLua files", desc = "fzf files" },
    { "<leader>ps", "FzfLua live_grep", desc = "fzf grep" },
    { "<leader>psb", "FzfLua buffers", desc = "fzf buffers" },
  },
  config = function()
    require("fzf-lua").setup({"telescope"})

    vim.keymap.set("n", "<leader>pf","<cmd>FzfLua files<CR>", { silent = true })
    vim.keymap.set("n", "<leader>ps","<cmd>FzfLua live_grep<CR>", { silent = true })
    vim.keymap.set("n", "<leader>psb","<cmd>FzfLua buffers<CR>", { silent = true })
  end
}
