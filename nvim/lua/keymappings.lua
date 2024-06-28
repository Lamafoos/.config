local set = vim.keymap.set

-- Move lines
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "<C-down>", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "<C-up>", ":m '<-2<CR>gv=gv")

-- Keep cursor sane
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("x", "<leader>p", [["_dP]]) -- overwrite without copying

-- Yank to system clipboard
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

-- Unknown goodie
set("n", "Q", "<nop>")

-- switch project
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format
set("n", "<leader>f", ":Format<CR>") -- format

-- replace the word your on
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- exit
set("i", "<C-c>", "<Esc>")
