return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				'saghen/blink.cmp',
				'folke/lazydev.nvim',
				'stevearc/conform.nvim',
				ft = 'lua',
				opts = {
					library = {
						{ path = '${3rd}/luv/library', words = { 'vim%.uv' } }
					}
				},
			}
		},
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = args.buf,
						callback = function()
							local filetype = vim.bo[args.buf].filetype
							local conform_filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }

							if vim.tbl_contains(conform_filetypes, filetype) then
								require('conform').format({ bufnr = args.buf, async = true, lsp_fallback = true })
							else
								local client = vim.lsp.get_client_by_id(args.data.client_id)

								if client and client.supports_method('textDocument/formatting') then
									vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
								end
							end
						end
					})
				end
			})

			local capabilities = require('blink.cmp').get_lsp_capabilities()

			require('lspconfig').lua_ls.setup {
				capabilities = capabilities,
			}

			require('lspconfig').ts_ls.setup {
				capabilities = capabilities,
			}

			require('lspconfig').pylsp.setup {
				capabilities = capabilities,
			}

			vim.keymap.set('n', '<space>e', function()
				vim.diagnostic.open_float()
			end, { desc = 'open vim diagnostic floating window' })
		end
	}
}
