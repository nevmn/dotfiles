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

" enable Normal mode keys in ru layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

syntax on
filetype plugin indent on

let mapleader=","

map <leader>ss :setlocal spell!<cr>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

call plug#begin(stdpath('data') . '/plugged')
    "Plug 'tpope/vim-surround'
    "Plug 'tpope/vim-fugitive'
    "Plug 'airblade/vim-gitgutter'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    "Plug 'easymotion/vim-easymotion'
    Plug 'itchyny/lightline.vim'
    Plug 'shinchu/lightline-gruvbox.vim'
    "Plug 'editorconfig/editorconfig-vim'
    Plug 'nelsyeung/twig.vim'
    Plug 'mattn/emmet-vim'
    "Plug 'honza/vim-snippets'
    "Plug 'pangloss/vim-javascript'
    "Plug 'posva/vim-vue'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'bkad/CamelCaseMotion'
    "Plug 'majutsushi/tagbar'
    Plug 'morhetz/gruvbox'
    Plug 'lifepillar/vim-gruvbox8'
    "Plug 'neovim/nvim-lspconfig'
    "Plug 'nvim-lua/completion-nvim'
    "Plug 'nvim-lua/popup.nvim'
    "Plug 'nvim-lua/plenary.nvim'
    "Plug 'nvim-lua/telescope.nvim'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'aserebryakov/vim-todo-lists'
    Plug 'tikhomirov/vim-glsl'
call plug#end()

let g:camelcasemotion_key = '<leader>'

nnoremap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox8_hard

let g:indentLine_leadingSpaceEnabled = 1

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
let g:lightline.colorscheme = 'gruvbox'
let g:lightline_gruvbox_style  = 'hard_left'

"inoremap <C-Space> <C-x><C-o>
"inoremap <C-@> <C-Space>

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> K     <cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>
nnoremap <silent> gs    <cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>
nnoremap <silent> gS    <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent> gR    <cmd>lua require'lspsaga.rename'.rename()<CR>
nnoremap <silent> gr    <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gF    <cmd>lua vim.lsp.buf.formatting_sync()<CR>
nnoremap <silent> gA    <cmd>lua require'lspsaga.codeaction'.code_action()<CR>
nnoremap <silent> <C-p> <cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>
nnoremap <silent> <C-n> <cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>
nnoremap <silent> gnd   <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
nnoremap <silent> gpd   <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>

nnoremap <silent> <F3> :Files<CR>

autocmd BufWritePost plugins.lua PackerCompile

autocmd Filetype * setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"map <c-p> to manually trigger completion
inoremap <silent><expr> <c-p> completion#trigger_completion() 

lua << EOF
require('plugins')

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"php", "vue", "typescript", "javascript", "json", "yaml", "html", "regex", "css", "c", "jsdoc", "cpp", "toml", "rust", "haskell"},
  highlight = {
    enable = true,
  },
}
EOF
