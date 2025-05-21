return {
	{
		enabled = false,
		"folke/tokyonight.nvim",
	},
	{
		"rose-pine/neovim",
		config = function()
			require('rose-pine').setup({
				styles = {
					italic = false,
					bold = false
				}
			})
			vim.cmd('colorscheme rose-pine')
		end
	}
}
