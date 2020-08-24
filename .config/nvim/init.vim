set nocompatible
set autoindent
set autoread
au FocusGained,BufEnter * :checktime
set background=dark
set backspace=indent,eol,start
set nobackup
set cmdheight=1
set display+=lastline
set encoding=utf8
set noerrorbells
set expandtab
set fileformats=unix,dos,mac
set hlsearch
set hidden
set history=1000
set ignorecase
set incsearch
set lazyredraw
set langmenu=en
set laststatus=2
set linebreak
set magic
set matchpairs+=<:>
set matchtime=2
set mouse=a
set number
set ruler
set scrolloff=7
set shiftwidth=4
set showbreak=+++
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=4
set textwidth=500
set noswapfile
set novisualbell
set whichwrap+=<,>,h,l
set wildmenu
set wrap
set nowritebackup
set termguicolors
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

syntax on
filetype plugin indent on

let mapleader=","

map <leader>ss :setlocal spell!<cr>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

call plug#begin(stdpath('data') . '/plugged')
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'easymotion/vim-easymotion'
    Plug 'itchyny/lightline.vim'
    Plug 'shinchu/lightline-gruvbox.vim'
    "Plug 'editorconfig/editorconfig-vim'
    Plug 'nelsyeung/twig.vim'
    "Plug 'honza/vim-snippets'
    Plug 'pangloss/vim-javascript'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'bkad/CamelCaseMotion'
    "Plug 'majutsushi/tagbar'
    Plug 'morhetz/gruvbox'
    Plug 'neovim/nvim-lsp'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-lua/diagnostic-nvim'
call plug#end()

let g:camelcasemotion_key = '<leader>'

nnoremap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

let g:indentLine_leadingSpaceEnabled = 1

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let g:lightline_gruvbox_style  = 'hard_left'

"inoremap <C-Space> <C-x><C-o>
"inoremap <C-@> <C-Space>

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gF    <cmd>lua vim.lsp.buf.formatting_sync()<CR>
nnoremap <silent> gA    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gnd   :NextDiagnosticCycle<CR>
nnoremap <silent> gpd   :PrevDiagnosticCycle<CR>

nnoremap <silent> <F3> :FZF<CR>

autocmd Filetype * setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"map <c-p> to manually trigger completion
inoremap <silent><expr> <c-p> completion#trigger_completion() 

lua << EOF

local on_attach_vim = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end

local nvim_lsp = require'nvim_lsp'

nvim_lsp.intelephense.setup{
    on_attach = on_attach_vim
}
nvim_lsp.cssls.setup{
    on_attach = on_attach_vim
}
nvim_lsp.dockerls.setup{
    on_attach = on_attach_vim
}
nvim_lsp.html.setup{
    on_attach = on_attach_vim
}
nvim_lsp.jsonls.setup{
    cmd = {"json-languageserver", "--stdio"},
    on_attach = on_attach_vim
}
nvim_lsp.rust_analyzer.setup{
    on_attach = on_attach_vim
}
nvim_lsp.vimls.setup{
    on_attach = on_attach_vim
}
nvim_lsp.vuels.setup{
    on_attach = on_attach_vim
}
nvim_lsp.tsserver.setup{
    on_attach = on_attach_vim
}
nvim_lsp.clangd.setup{
    on_attach = on_attach_vim
}
nvim_lsp.hie.setup{
    on_attach = on_attach_vim
}
EOF
