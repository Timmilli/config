-- for neo-tree
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.nu = true

-- tabs

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.expandtab = false

-- vim.g.python_recommended_style = 0
---

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hls = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- vim.opt.nocompatible = true
-- vim.opt.syntax = true
-- filetype plugin on
