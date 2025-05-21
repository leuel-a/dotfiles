return {
	'stevearc/conform.nvim',
	opts = {},
	config = function()
		require('conform').setup {
			formatters_by_ft = {
				javascript = { 'prettier' },
				typescript = { 'prettier' },
				javascriptreact = { 'prettier' },
				typescriptreact = { 'prettier' },
			}
		}
	end
}
