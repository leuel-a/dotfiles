return {
    "neoclide/coc.nvim",
    branch = "release",
    build = "npm --global ci",
    config = function()
        vim.g.coc_global_extensions = { 'coc-pyright' }
    end,
    ft = "python", -- to only enable this plugin in python files
}
