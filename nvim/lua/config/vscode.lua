vim.keymap.set("n", "<leader>pf", function()
	vim.fn.VSCodeNotify("workbench.action.quickOpen")
end, { noremap = true, silent = true })
