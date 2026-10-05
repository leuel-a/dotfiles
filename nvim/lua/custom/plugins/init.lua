-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'tpope/vim-fugitive' },
  {
    'stevearc/oil.nvim',
    enabled = true,
    opts = {},
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    config = function()
      require('oil').setup {
        default_file_explorer = true,
        skip_confirm_for_simple_edits = false,
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

        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '<leader>o', '<CMD>Oil<CR>', { desc = '[O]pen [O]il' })
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = true,
    config = function()
      require('rose-pine').setup { styles = { italic = false, bold = false } }
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    name = 'vscode',
    enabled = true,
  },
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    enabled = true,
  },
  {
    'alexpasmantier/hubbamax.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.g.zenbones_italic_comments = false
      vim.g.zenbones_italic_strings = false

      vim.g.zenwritten_italic_comments = false
      vim.g.zenwritten_italic_strings = false

      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'zen*',
        callback = function()
          for name, def in pairs(vim.api.nvim_get_hl(0, {})) do
            if def.italic or (def.cterm and def.cterm.italic) then
              def.italic = false
              if def.cterm then
                def.cterm.italic = false
              end
              vim.api.nvim_set_hl(0, name, def)
            end
          end
        end,
      })
    end,
  },
  {
    'mfussenegger/nvim-jdtls',
    name = 'nvim-jdtls',
  },
}
