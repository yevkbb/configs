cd ~

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin('~/.vim/bundle/')

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
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'
Plugin 'godlygeek/tabular'
Plugin 'bitc/vim-hdevtools'

call vundle#end()
syntax on
filetype plugin indent on

" Leaders
let mapleader = ","
let maplocalleader = "\\"

" General Editor Settings
set wrap
set nolist
set linebreak
set laststatus=2
set encoding=utf-8
set relativenumber
set number
set tabstop=2
set expandtab
set shiftwidth=2
set backspace=start,indent,eol

" General Mapping
inoremap jj <Esc>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'kalisi'

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|output\|dist'

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
let NERDTreeQuitOnOpen = 1
nmap <leader>n :NERDTreeToggle<cr>
au FileType nerdtree nnoremap <localleader>b :Bookmark<cr>

" Themes and Colors
colorscheme kalisi
set background=dark
set guifont=Source_Code_Pro_Light:h12
au GUIEnter * simalt ~x
"set lines=38
"set columns=145

" PureScript
let g:purescript_indent_if = 2
let g:purescript_indent_do = 2
let g:purescript_indent_where = 2

" PSC IDE
let g:psc_ide_syntastic_mode = 1
au FileType purescript nnoremap <localleader>t :PSCIDEtype<cr>
au FileType purescript nnoremap <localleader>i :PSCIDEimportIdentifier<cr>
au FileType purescript nnoremap <localleader>a :PSCIDEapplySuggestion<cr>

" Task Files
let @d='xiOKjj' " Macro to mark an item as done
imap <C-b> <C-k>PR<Tab>
nmap <C-d> @d

" Haskell
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>

au FileType haskell nnoremap <buffer> tq :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> te :HdevtoolsClear<CR>

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  else " no gui
      if has("unix")
            inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
              endif
            endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
