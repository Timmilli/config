vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-j>", "}")
vim.keymap.set("n", "<C-k>", "{")

vim.keymap.set("v", "<C-j>", "}")
vim.keymap.set("v", "<C-k>", "{")

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
