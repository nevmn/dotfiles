vim.cmd [[packadd packer.nvim]]

return require'packer'.startup(function ()
    use {'wbthomason/packer.nvim', opt = true}

    use 'lifepillar/vim-gruvbox8'

    use 'tpope/vim-surround'

    use 'tpope/vim-fugitive'

    use 'airblade/vim-gitgutter'

    use {'shinchu/lightline-gruvbox.vim', requires = {'itchyny/lightline.vim'}}

    use 'kyazdani42/nvim-tree.lua'

    use 'nelsyeung/twig.vim'

    use 'mattn/emmet-vim'

    use {'junegunn/fzf.vim', requires = {'junegunn/fzf', run = 'fzf#install()' }}

    use {'neovim/nvim-lspconfig',
        requires = {'nvim-lua/completion-nvim'},
        config = function()
            local on_attach_vim = function()
              require'completion'.on_attach()
            end

            local nvim_lsp = require'lspconfig'

            require'lspconfig'.sumneko_lua.setup {
              cmd = {'/usr/bin/lua-language-server'};
              settings = {
                Lua = {
                  runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';'),
                  },
                  diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                  },
                  workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                      [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                      [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                  },
                },
              },
              on_atatch = on_attach_vim
            }
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
            nvim_lsp.hls.setup{
                on_attach = on_attach_vim
            }
            nvim_lsp.bashls.setup{
                on_attach = on_attach_vim
            }
            nvim_lsp.yamlls.setup{
                on_attach = on_attach_vim
            }
    end}


    use {'nvim-lua/popup.nvim', requires = {'nvim-lua/plenary.nvim'}}

    use 'nvim-lua/telescope.nvim'

    use 'bkad/CamelCaseMotion'

    use 'kdheepak/lazygit.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function ()
            require'nvim-treesitter.configs'.setup {
              ensure_installed = {"php", "vue", "typescript", "javascript", "json", "yaml", "html", "regex", "css", "c", "jsdoc", "cpp", "toml", "rust", "haskell"},
              highlight = {
                enable = true,
              },
            }
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        opt = true,
        requires = {'nvim-treesitter/nvim-treesitter'}
    }
end)
