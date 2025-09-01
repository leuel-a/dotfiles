local function is_git_repository()
    return vim.fn.systemlist('git rev-parse --is-inside-work-tree 2> /dev/null')[1] == 'true'
end

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = function()
            require("telescope").setup {
                pickers = {
                    -- git_files = {
                    --     recurse_submodules = true,
                    --     theme = "ivy"
                    -- },
                    -- find_files = {
                    --     theme = "ivy",
                    -- }
                },
                extensions = {
                    fzf = {}
                }
            }

            require("telescope").load_extension("fzf")

            vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)

            vim.keymap.set("n", "<space>lg", require("telescope.builtin").live_grep)

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<space>fd", function()
                builtin.find_files({
                    theme = "dropdown",
                    cwd = vim.loop.cwd(),
                    hidden = true,
                    file_ignore_patterns = { "node_modules", "dist", ".venv", ".git" }
                })
            end)

            vim.keymap.set("n", "<space>en", function()
                builtin.find_files {
                    theme = "dropdown",
                    cwd = vim.fn.stdpath("config"),
                    hidden = true,
                    file_ignore_patterns = { ".git" }
                }
            end)
        end
    }
}
