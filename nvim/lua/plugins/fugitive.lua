return {
	'tpope/vim-fugitive',
	config = function()
		vim.keymap.set('n', '<space>gs', '<cmd>Git<CR>', { desc = "open git status" })
	end
}
