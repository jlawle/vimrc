"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug-Plugins
"" If the plugin manager has not been isntalled already 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" vim-Plug Plugin List
call plug#begin('~/.vim/plugins')

Plug 'preservim/nerdtree'                        " file tree sidebar
Plug 'jremmen/vim-ripgrep'                       " a really fast grep
Plug 'tpope/vim-fugitive'                        " For git blames, logs, diffs, etc, google it
Plug 'mbbill/undotree'              
Plug 'vim-utils/vim-man'                         " vim man pages
Plug 'leafgarland/typescript-vim'                " allows typscript files to be nicely colored
Plug 'junegunn/vim-plug'                         " rovide :help plug-options
Plug 'ctrlp/ctrlp.vim'                           " Ctrl+p for file finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'                        " Useful for bracket stuff
"Plug 'Valloric/YouCompleteMe'                   " Autofill suggestion

" colorschemes
Plug 'morhetz/gruvbox'                           " colorscheme
Plug 'sainnhe/gruvbox-material'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
call plug#end()


" Plugin adjustments
if executable('rg')                         " Allows  searching root for faster searching and gitignores
    let g:rg_derive_root='true'
endif
                                            " Ignores some basic stuff to not search for
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "                         " What to press to enter into command mode: SPACE
set runtimepath^=~/.vim/bundle/ctrlp.vim    " Used to set ctrl+p file searching exec path

" Tmux shit
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set termguicolors
set term=xterm-256color


" Set Color 
colorscheme gruvbox
set background=dark
syntax enable

" Set Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab                       

" Set Misc
set t_ut=""                             " Fixes a weird terminal background color glitch
set noerrorbells                        " No error bells
set relativenumber                      " Sets side numbers relative to cursor (# + UP/DOWN to hop)
set smartindent                         " Self Explanatory
set nowrap                              " No wrapping, yo
set smartcase                           " Case sensitive searching
set noswapfile                          " no swap files
set undodir=~/.vim/undodir
set undofile

" Set key mappings
let mapleader = " "
map <C-t> :NERDTreeToggle<CR>
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>



" Set line numbers
set relativenumber
highlight LineNr ctermfg=lightgray
hi Normal ctermfg=white


autocmd FileType make setlocal noexpandtab
autocmd FileType go setlocal noexpandtab


" Go Imports
autocmd BufWritePost *.go
        \ if executable('goimports') |
        \        silent execute '!goimports -w %' |
        \        edit! |
        \ endif

set backspace=indent,eol,start
set clipboard=unnamedplus
set tags=./tags.tags;HOME
