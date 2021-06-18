vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function ()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    use 'easymotion/vim-easymotion'

    use 'preservim/nerdtree'
    use 'Xuyuanp/nerdtree-git-plugin'

    use {'itchyny/lightline.vim', 'shinchu/lightline-gruvbox.vim'}

    use 'nelsyeung/twig.vim'
    use 'mattn/emmet-vim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use 'kyazdani42/nvim-web-devicons'

    use 'bkad/CamelCaseMotion'

    use 'morhetz/gruvbox'
    use 'lifepillar/vim-gruvbox8'

    use 'kdheepak/lazygit.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'aserebryakov/vim-todo-lists'
    use 'tikhomirov/vim-glsl'

    use {'junegunn/fzf', run = 'fzf#install()'}
    use 'junegunn/fzf.vim'

    use {
        'neovim/nvim-lspconfig',
        requires = {'nvim-lua/completion-nvim'},
        config = function()

            local on_attach_vim = function()
              require'completion'.on_attach()
            end

            local nvim_lsp = require'lspconfig'

            nvim_lsp.intelephense.setup{
                on_attach = on_attach_vim
            }
            nvim_lsp.cssls.setup{
                cmd = { "css-languageserver", "--stdio" },
                on_attach = on_attach_vim
            }
            nvim_lsp.dockerls.setup{
                on_attach = on_attach_vim
            }
            nvim_lsp.html.setup{
                cmd = { "html-languageserver", "--stdio" },
                on_attach = on_attach_vim
            }
            nvim_lsp.jsonls.setup{
                cmd = { "json-languageserver", "--stdio" },
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
            nvim_lsp.dhall_lsp_server.setup{
                on_attach = on_attach_vim
            }

            local sumneko_root_path = vim.fn.stdpath('data')
                ..'/site/pack/packer/start/nvim-lspconfig/lua/lspconfig/sumneko_lua.lua'

            nvim_lsp.sumneko_lua.setup{
                cmd = {
                    "/usr/bin/lua-language-server",
                    "-E",
                    sumneko_root_path
                };
                  settings = {
                Lua = {
                  runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';'),
                  },
                  diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim', 'use'},
                  },
                  workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                      [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                      [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                  },
                  -- Do not send telemetry data containing a randomized but unique identifier
                  telemetry = {
                    enable = false,
                  },
                },
              },
                on_attach = on_attach_vim
            }
        end
    }

    use {
        'glepnir/lspsaga.nvim',
        config = function()
            require'lspsaga'.init_lsp_saga()
        end
    }

    --use {
    --    'lewis6991/gitsigns.nvim',
    --    requires = {'nvim-lua/plenary.nvim'},
    --    config = function ()
    --        require'gitsigns'.setup()
    --    end
    --}

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
