set number
set relativenumber

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
source ~/.vim/mappings/fzf-mappings.vim

call plug#end()

