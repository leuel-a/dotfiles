local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'telescope find project files' })
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'telescope find git files in project' })
