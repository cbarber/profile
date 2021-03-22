set shell=bash
set expandtab
set smartindent
set autoindent
set number
filetype indent on

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'yssl/QFEnter'
Plug 'junegunn/fzf.vim'

" syntax
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'elixir-editors/vim-elixir'
Plug 'dart-lang/dart-vim-plugin'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git integration
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'

Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script'

" javascript
Plug 'hotoo/jsgf.vim'

" go
Plug 'fatih/vim-go'

" rust
Plug 'rust-lang/rust.vim'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'

call plug#end()

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources = {'rust': ['ale', 'racer']}

" let g:racer_cmd = "/home/cbarber/.cargo/bin/racer"
" let g:racer_experimental_completer = 1
" let g:racer_insert_paren = 1

let g:rustfmt_autosave = 1

" let g:ale_rust_rls_toolchain = 'nightly-YYYY-MM-DD'

let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

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

colorscheme onedark

set exrc " per-project config
set secure " prevent unsafe commands in per-project config
