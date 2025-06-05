return {
	{
		enabled = true,
		"folke/tokyonight.nvim",
	},
	{
		enabled = true,
		"rose-pine/neovim",
		config = function()
			require('rose-pine').setup({
				styles = {
					italic = false,
					bold = false
				}
			})
		end
	},
	{
		enabled = true,
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	}
}
