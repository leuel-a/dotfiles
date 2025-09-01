return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'saghen/blink.cmp',
                'folke/lazydev.nvim',
                -- 'stevearc/conform.nvim',
                ft = 'lua',
                opts = {
                    library = {
                        { path = '${3rd}/luv/library', words = { 'vim%.uv' } }
                    }
                },
            }
        },
        config = function()
            -- vim.api.nvim_create_autocmd('LspAttach', {
            --     callback = function(args)
            --         vim.api.nvim_create_autocmd('BufWritePre', {
            --             buffer = args.buf,
            --             callback = function()
            --                 local filetype = vim.bo[args.buf].filetype
            --                 local conform_filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }

            --                 if vim.tbl_contains(conform_filetypes, filetype) then
            --                     require('conform').format({ bufnr = args.buf, async = true, lsp_fallback = true })
            --                 else
            --                     local client = vim.lsp.get_client_by_id(args.data.client_id)

            --                     if client and client.supports_method('textDocument/formatting') then
            --                         vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            --                     end
            --                 end
            --             end
            --         })
            --     end
            -- })

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            require('lspconfig').lua_ls.setup { capabilities = capabilities }
            require('lspconfig').ts_ls.setup {
                capabilities = capabilities,
            }

            vim.lsp.enable('clangd')
            vim.lsp.enable('csharp_ls')
            vim.lsp.enable('cssls')
            vim.lsp.enable('css_variables')
            vim.lsp.enable('gopls')
            vim.lsp.enable('pyright')
            vim.lsp.enable('pylsp')
            vim.lsp.enable('tailwindcss')

            local css_capabilities = vim.lsp.protocol.make_client_capabilities()
            css_capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.config('cssls', { capabilities = css_capabilities })
            vim.lsp.config('tailwindcss', {
                capabilities = css_capabilities,
                filetypes = {
                    "cshtml", "html", "typescriptreact", "javascriptreact"
                }
            })
            vim.lsp.config('clangd', {
                capabilities = capabilities,
                cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
            })
            vim.lsp.config('csharp_ls', {
                capabilities = capabilities,
                filetypes = { "cs" }
            })
            vim.lsp.config('pylsp', { capabilities = capabilities })
            vim.lsp.config('gopls', {
                capabilities = capabilities
            })

            vim.keymap.set('n', '<space>e', function()
                vim.diagnostic.open_float()
            end, { desc = 'open vim diagnostic floating window' })
        end
    }
}
