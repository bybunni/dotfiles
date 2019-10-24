syntax on
let python_highlight_all=1
set guifont=Consolas:h11
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set textwidth=80
set hidden
set splitbelow
set splitright
let g:netrw_liststyle=3

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'

call plug#end()
" YouCompleteMe installation and update procedure
" sudo apt install build-essential cmake python3-dev
" Compiling YCM without semantic support for C-family languages
" cd ~/.vim/plugged/YouCompleteMe
" python3 install.py

set laststatus=2
" For lightline to appear correctly inside tmux add to .bashrc
" export TERM='screen-256color' 
set t_Co=256
colorscheme delek
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }

