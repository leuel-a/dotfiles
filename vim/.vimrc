set number
set relativenumber

" needed for vim since vim calculates byte offset by count
set encoding=utf-8

" some servers have issues with .swp files
set nobackup
set nowritebackup

" set mouse for all modes
set mouse=a

" having longer updatetime (default is 4000 ms = 4s)
" leads to noticable delays and poor user experience
set updatetime=300

" use the system clipboard for my copy buffer in vim
set clipboard=unnamedplus

" set filetype plugins to create configuration files for specific file types
filetype plugin on

" remap escape keyword when using the terminal mode in vim
tnoremap <C-j> <C-\><C-n>

" install plugins with vim-plug plugin manager
call plug#begin('~/.vim/plugged')

for plugin_file in split(glob('~/.vim/plugins/*.vim'), '\n')
	execute 'source' plugin_file
endfor

" source key mappings
nnoremap <silent> <space>o <cmd>Explore<CR>
nnoremap <silent> <space>gs <cmd>Git<CR>

source ~/.vim/mappings/fzf-mappings.vim
source ~/.vim/mappings/neoclide-mappings.vim

" source config files like language server configurations
source ~/.vim/config/neoclide-coc.vim

call plug#end()

" set theme for the vim file system and also set background
syntax on
set background=dark
colorscheme rosepine

" function to highlight yanked text
function! HighlightYank() abort
  let l:pattern = '\%''\[\_.\{-}\%''\]'
  let l:match_id = matchadd('IncSearch', l:pattern, 10)

  call timer_start(300, function('s:DeleteMatch', [l:match_id]))
endfunction

" Define a script-local function to delete the highlight
function! s:DeleteMatch(match_id, timer) abort
  call matchdelete(a:match_id)
endfunction

autocmd TextYankPost * call HighlightYank()
