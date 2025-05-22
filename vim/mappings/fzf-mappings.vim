function! IsGitRepository()
	let l:output = system('git rev-parse --is-inside-work-tree 2> /dev/null')
	return l:output =~# 'true'
endfunction

if IsGitRepository()
	noremap <space>fd <cmd>GitFiles<CR>
else
	noremap <space>fd <cmd>Files<CR>
endif
