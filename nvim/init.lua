-- TODO: move the editor configuration to separate file
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.o.foldenable = true

vim.o.expandtab = true
vim.o.smartindent = true

-- number of spaces character per tab
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- enable folding using tree-sitter
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99  -- opens all folds by default; adjust as desired

-- this needs an autocommand to ensure that it runs before the terminal is open
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		-- set a terminal mapping for the current buffer
		vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<C-\\><C-n>", { noremap = true, silent = true })
	end
})

-- plugin manager and plugin imports
require("config.lazy")
require("config.lspconfig")

-- key remaps 
require("remaps")

