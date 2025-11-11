-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- NOTE: Neovim options
local opt = vim.opt

opt.laststatus = 3
opt.backup = false
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hidden = true
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 8
opt.pumblend = 0
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.swapfile = true
opt.timeoutlen = 500
opt.undofile = true
opt.updatetime = 100
opt.writebackup = false
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 5
opt.signcolumn = "yes"
opt.wrap = false
opt.lazyredraw = false
opt.termguicolors = true
opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " }
opt.ruler = false
opt.cmdheight = 0
opt.helpheight = 10
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

opt.shortmess:append("Ac")
opt.whichwrap:append("<>[]hl")
opt.iskeyword:append("-")

require("config.globals")
