vim.g.have_nerd_font = false

-- for neo-tree
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Make line numbers default
vim.opt.number = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.expandtab = false

-- To share sclipboard between Nvim and Os
vim.o.clipboard = 'unnamedplus'

-- Save undo history
vim.opt.undofile = true

-- To :write automatically before any other command is run
vim.o.autowriteall = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 50

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 7

vim.opt.colorcolumn = "81"

vim.opt.linebreak = false

vim.opt.textwidth = 80

vim.opt.termguicolors = true
