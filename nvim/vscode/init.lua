vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.clipboard = 'unnamedplus'

if vim.g.vscode then
	local vscode = require('vscode')

	vim.keymap.set('n', '<space>fd', function() vscode.action('workbench.action.quickOpen') end,
		{ desc = "Open quick open file picker for searching files" })

	vim.keymap.set('n', '<space>en', function() vscode.action('workbench.action.openSettingsJson') end,
		{ desc = 'Open vscode user settings JSON file' })

	vim.keymap.set('n', '<space>fc', function() vscode.action('workbench.action.showCommands') end,
		{ desc = 'Open show all commands picker' })

	vim.keymap.set('n', '<space>ff', function() vscode.action('editor.action.formatDocument') end,
		{ desc = 'Format the current document' })
end
