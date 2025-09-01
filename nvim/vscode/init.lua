vim.opt.clipboard = "unnamedplus"

if vim.g.vscode then
  local vscode = require("vscode")

  vim.keymap.set("n", "<space>fd", function() vscode.action("workbench.action.quickOpen") end,
    { desc = "open quick open in vscode" })

  vim.keymap.set("n", "<space>fc", function() vscode.action("workbench.action.showCommands") end, {
    desc = "show all the commands"
  })

  vim.keymap.set({ "n", "v" }, "<space>en",
    function() vscode.action("workbench.action.openSettingsJson") end,
    { desc = "open configuration for vscode / cursor" })

  vim.keymap.set({ "n", "v" }, "<space>o",
    function() vscode.action("workbench.action.toggleSidebarVisibility") end, {
      desc = "toggle sidebar when on normal, or visual mode in vscode / cursor"
    })

  vim.keymap.set({ "n", "v" }, "<space>st",
    function() vscode.action("workbench.action.terminal.toggleTerminal") end, {
      desc = "toggle terminal toggle terminal for visual and normal modes"
    })
end
