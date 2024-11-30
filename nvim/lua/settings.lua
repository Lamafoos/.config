-----------------------------------------------------------
-- ALIASES ------------------------------------------------
-----------------------------------------------------------
-- local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
-- local env = vim.env -- environment variables
-- local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " "
opt.mouse = "a" -- enable mouse support
opt.swapfile = false -- don't use swapfile
opt.backup = false -- no backup
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.spell = true -- spellchecking
opt.spelllang = { "en_us" } -- languange to spellcheck
opt.updatetime = 50
-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.number = true -- show line number
opt.relativenumber = true -- show relative number
opt.hlsearch = false -- show partial matches
opt.incsearch = true -- show partial matches
opt.linebreak = true -- dont cut word on word wrap
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 8

-- highlight on yank
exec(
	[[
  augroup LuaHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]],
	false
)
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.softtabstop = 4 -- 1 tab == 4 spaces
opt.expandtab = true -- fill tab spaces
opt.smartindent = true -- autoindent new lines
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 300 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight
