local config = function()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
end


return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = config
}
