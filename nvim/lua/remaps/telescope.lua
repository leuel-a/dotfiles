local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope Find Files' })
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Telescope Find Files' })
