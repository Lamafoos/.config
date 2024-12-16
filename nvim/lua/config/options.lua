-----------------------------------------------------------
-- ALIASES ------------------------------------------------
-----------------------------------------------------------
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " "
g.maplocalleader = "\\"
g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

opt.laststatus = 3 -- global statusline
opt.mouse = "a" -- enable mouse support
opt.swapfile = false -- don't use swapfile
opt.backup = false -- no backup
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.spelllang = { "en" }
opt.spell = true -- spellchecking
opt.updatetime = 200
-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.number = true -- show line number
opt.relativenumber = true -- show relative number
opt.linebreak = true -- wrap at convenient places
opt.termguicolors = true -- True color support
opt.wrap = false -- disable line wrap
opt.scrolloff = 8 -- Lines of context
opt.pumblend = 10 -- Popup blend
opt.smoothscroll = true
opt.foldmethod = "expr"
opt.foldtext = ""
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.shiftround = true -- round indent
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.expandtab = true -- spaces instead of tab
opt.smartindent = true -- auto indent new lines
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 300 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight
