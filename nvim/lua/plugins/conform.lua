return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require('conform').setup {
            formatters_by_ft = {
                html = { 'prettier' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
            },
            formatters = {
                prettier = {
                    prepend_args = {}
                }
            },
            format_on_save = {
                timeout_ms = 5000,
                lsp_format = "fallback",
            },
        }
    end,
}
