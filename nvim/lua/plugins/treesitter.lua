return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
	ensure_installed = {
	  "c", "lua", "vim", "vimdoc", "query", "markdown", "javascript" ,"typescript" 
	},
	sync_install = false,
	highlight = {
	  enable = true,
	  -- TODO: I dont really know if I need this but by default I will just enable it
	  -- or useear
	  -- ua function for more flexibility, e.g. to disable slow treesitter highlight for large files
	  disable = function(lang, buf)
	    local max_filesize = 100 * 1024 -- 100 KB
	    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	    if ok and stats and stats.size > max_filesize then
	      return true
	    end
	  end,

	  -- setting this to true will run `:h syntax` and tree-sitter at the same time.
	  -- set this to `true` if you depend on gsyntax being enabled (like for indentation).
	  -- using this option may slow down your editor, and you may see some duplicate highlights.
	  -- instead of true it can also be a list of languages
	  additional_vim_regex_highlighting = false,
	},
      }
    end
  }
}
