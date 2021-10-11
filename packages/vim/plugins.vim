" All the pretty plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
" Plug 'morhetz/gruvbox'
" Plug 'will133/vim-dirdiff'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
" Plug 'terryma/vim-multiple-cursors' -> vim-visual-multi
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'rhysd/vim-clang-format'
Plug 'SirVer/ultisnips'
Plug 'edkolev/tmuxline.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" :PlugInstall
call plug#end()
