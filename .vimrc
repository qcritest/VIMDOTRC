set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" hidden files in ctrlp
let g:ctrlp_show_hidden = 1

if executable('pt')
  " Use pt in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'pt %s -l --nocolor --hidden --home-ptignore -g ""'

  " pt is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " use pt for ack
  let g:ackprg = 'pt --nogroup --nocolor --column --home-ptignore'
endif

set tabstop=2
set autoindent

autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-o> :NERDTreeToggle<CR>



highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

augroup vimrc
  autocmd!
  autocmd FileType ruby,haml,html,eruby,yaml,sass,css,javascript,cucumber,coffee
    \ setlocal shiftwidth=2 |
    \ setlocal softtabstop=2 |
    \ setlocal tabstop=2
  autocmd FileType ruby,haml,html,eruby,yaml,sass,css,javascript,cucumber,vim,cpp
    \ autocmd BufWritePre <buffer> :%s/\s\+$//e
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd BufNewFile,BufRead *.md set ft=text
    autocmd FileType gitcommit setlocal spell textwidth=72
  augroup end
