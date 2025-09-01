return {
    { "folke/tokyonight.nvim",    name = "tokyonight", enabled = true, },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        enabled = true,
        config = function()
            require('rose-pine').setup({ styles = { italic = false, bold = false } })
        end
    },
    { "ellisonleao/gruvbox.nvim", name = "gruvbox",    enabled = true },
    { "catppuccin/nvim",          name = "catppuccin", enabled = true },
    { "EdenEast/nightfox.nvim",   name = "nightfox",   enabled = true },
    {
        "Mofiqul/vscode.nvim",
        name = "vscode",
        enabled = true,
        config = function()
            vim.cmd("colorscheme vscode")
        end
    },
    { "shaunsingh/nord.nvim",    name = "nord",      enabled = true },
    { "tiagovla/tokyodark.nvim", name = "tokyodark", enabled = true }
}
