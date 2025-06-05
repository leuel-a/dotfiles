return {
	'stevearc/oil.nvim',

	enabled = false,

	opts = {},

	dependencies = { { 'echasnovski/mini.icons', opts = {} } },

	config = function()
		require('oil').setup({
			default_file_explorer = true,

			skip_confirm_for_simple_edits = false,

			-- I have no idea what the errors are here
			keymaps = {
				['g?'] = { 'actions.show_help', mode = 'n' },
				['<CR>'] = 'actions.select',
				['<C-s>'] = { 'actions.select', opts = { vertical = true } },
				['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
				['<C-t>'] = { 'actions.select', opts = { tab = true } },
				['<C-p>'] = 'actions.preview',
				['<C-c>'] = { 'actions.close', mode = 'n' },
				['<C-l>'] = 'actions.refresh',
				['-'] = { 'actions.parent', mode = 'n' },
				['_'] = { 'actions.open_cwd', mode = 'n' },
				['`'] = { 'actions.cd', mode = 'n' },
				['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
				['gs'] = { 'actions.change_sort', mode = 'n' },
				['gx'] = 'actions.open_external',
				['g.'] = { 'actions.toggle_hidden', mode = 'n' },
				['g\\'] = { 'actions.toggle_trash', mode = 'n' },
			},
		})

		vim.keymap.set('n', '<space>o', '<CMD>Oil<CR>', { desc = "Open parent directory while being inside a buffer" })
	end
}
