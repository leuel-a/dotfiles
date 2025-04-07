return {
	"rose-pine/nvim",
	name = "rose-pine",
	config = function ()
        require("rose-pine").setup({
            variant = "main",
            dark_variant = "main",
            styles = {
                bold = false,
                italic = false
            },
        })
		vim.cmd("colorscheme rose-pine-main")
	end
}
