return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<space>gs', '<cmd>Git<CR>', { desc = "open git status" })
    vim.keymap.set('n', '<space>gc', '<cmd>Git commit<CR>', { desc = "open git commit fugitive window" })
  end
}
