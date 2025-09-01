vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- OPTIONS --
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false

-- FOR CODE BLOCK FOLDING WITH TREESITTER
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
-- OPTIONS --

-- KEYMAPS --
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n>")

vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>', { desc = "open next item on quick fix list" })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>', { desc = "open previous item on quick fix list" })
-- KEYMAPS --

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

vim.keymap.set("n", "<space>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)

require("config.lazy")
