" Vundle
set nocompatible
filetype off

set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'freeo/vim-kalisi'
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'scrooloose/nerdtree'
Plugin 'raichoo/purescript-vim'
Plugin 'FrigoEU/psc-ide-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/npm'

call vundle#end()
syntax on
filetype plugin indent on

" Leaders
let mapleader = ","
let maplocalleader = "\\"

" General Editor Settings
set laststatus=2
set encoding=utf-8
set relativenumber
set number
set tabstop=2
set expandtab
set shiftwidth=2

" General Mapping
inoremap jj <Esc>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'kalisi'

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|bower_components'

" Buffer
set hidden
nmap <leader>N :enew<cr>
nmap <leader>C :bd<cr>
nmap <leader>w :w<cr>

" Buffergator
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_viewport_split_policy = 'R'
nmap <leader>h :BuffergatorMruCyclePrev<cr>
nmap <leader>l :BuffergatorMruCycleNext<cr>

" NERDTree
let NERDTreeAutoCenter = 1
nmap <leader>n :NERDTreeToggle<cr>
au FileType nerdtree nnoremap <localleader>b :Bookmark<cr>

" Themes and Colors
colorscheme kalisi
set background=dark
set guifont=Source_Code_Pro_Light:h12
set lines=38
set columns=145

" PureScript
let g:purescript_indent_if = 2
let g:purescript_indent_do = 2
let g:purescript_indent_where = 2

" PSC IDE
let g:psc_ide_syntastic_mode = 1
au FileType purescript nnoremap <localleader>t :PSCIDEtype<cr>
au FileType purescript nnoremap <localleader>i :PSCIDEimportIdentifier<cr>
au FileType purescript nnoremap <localleader>a :PSCIDEapplySuggestion<cr>
