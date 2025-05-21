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
					find_files = { theme = "ivy" },
					live_grep = { theme = "ivy" },
					git_files = {
						theme = "ivy",
						recurse_submodules = true,
					}
				},
				extensions = {
					fzf = {}
				}
			}

			require("telescope").load_extension("fzf")

			vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)

			vim.keymap.set("n", "<space>lg", require("telescope.builtin").live_grep)

			if is_git_repository() then
				vim.keymap.set("n", "<space>fd", require("telescope.builtin").git_files)
			else
				vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
			end


			vim.keymap.set("n", "<space>en", function()
				require("telescope.builtin").find_files {
					cwd = vim.fn.stdpath("config")
				}
			end)
		end
	}
}
