local treesitter_config = {
	'nvim-treesitter/nvim-treesitter',
	build = function()
		require('nvim-treesitter.install').update({ with_sync = true })()
	end,
}

return { treesitter_config }
