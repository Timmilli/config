require("set")
require("remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

plugins = {}

opts = {}

-- require("lazy").setup(plugins, opts)
require("lazy").setup("plugins", opts)

require("lualine").setup()

require("autoclose").setup()

vim.cmd.colorscheme("catppuccin-mocha")
