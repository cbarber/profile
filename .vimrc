set shell=bash
set expandtab
set smartindent
set autoindent
set number
filetype indent on

set exrc " per-project config

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
" Plugin 'ctrlpvim/ctrlp.vim' " hate ctrlp
Plugin 'yssl/QFEnter'
Plugin 'junegunn/fzf.vim'


" syntax
Plugin 'pangloss/vim-javascript'
Plugin 'sheerun/vim-polyglot'
" Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'elixir-lang/vim-elixir'

" Plugin 'neomake/neomake'
" autocmd! BufWritePost * Neomake

" git integration
Plugin 'airblade/vim-gitgutter'
Plugin 'jreybert/vimagit'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-conflicted'

Plugin 'scrooloose/vimfiles'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'

" javascript
Plugin 'hotoo/jsgf.vim'

" go
Plugin 'fatih/vim-go'

" elixr / phoenix
Plugin 'c-brenn/phoenix.vim'

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

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Stupid javascript indenting from somewhere. Maybe find a better plugin
autocmd FileType javascript set tabstop=2|set shiftwidth=2

" Syntax defaults
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>'] 

let g:airline_powerline_fonts = 1

set secure " prevent unsafe commands in per-project config
