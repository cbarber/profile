set shell=bash
set expandtab
set smartindent
set autoindent
set number
set guifont="UbuntuMono Nerd Font Regular"
set nowrap
filetype indent on

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'yssl/QFEnter'
Plug 'junegunn/fzf.vim'

" syntax
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'
Plug 'dart-lang/dart-vim-plugin'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" git integration
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'

Plug 'akinsho/toggleterm.nvim'

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

" LSP configuration
lua << END
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Forward to other plugins
  -- require'completion'.on_attach(client, bufnr)
  client.resolved_capabilities.document_formatting = true
end

local cmp = require('cmp')
cmp.setup({
  completion = {
     autocomplete = false, -- disable auto-completion.
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

vim.cmd([[
  inoremap <C-x><C-o> <Cmd>lua require('cmp').complete()<CR>
]])
  -- inoremap <C-x><C-o> <Cmd>lua vimrc.cmp.lsp()<CR>
  -- inoremap <C-x><C-s> <Cmd>lua vimrc.cmp.snippet()<CR>

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { "solargraph", "rust_analyzer" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    init_options = {formatting = true},
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }
end

require("toggleterm").setup{}
END

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = false }

" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.ruby = ['rails', 'ruby']
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

let g:rustfmt_autosave = 1

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

" Stupid javascript indenting from somewhere. Maybe find a better plugin
autocmd FileType javascript set tabstop=2|set shiftwidth=2

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>'] 

let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

let g:airline#extensions#nvimlsp#enabled = 0

colorscheme onedark

set exrc " per-project config
set secure " prevent unsafe commands in per-project config
