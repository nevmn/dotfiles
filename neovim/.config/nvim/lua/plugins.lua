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

    use 'norcalli/nvim-colorizer.lua'

    use 'kdheepak/lazygit.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'aserebryakov/vim-todo-lists'
    use 'tikhomirov/vim-glsl'

    use {'junegunn/fzf', run = 'fzf#install()'}
    use 'junegunn/fzf.vim'


    use {
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
        config = function()

            local cmp = require'cmp'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = {
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' }
                }
            })

            local nvim_lsp = require'lspconfig'

            nvim_lsp.intelephense.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.cssls.setup{
                cmd = { "css-languageserver", "--stdio" },
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.dockerls.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.html.setup{
                cmd = { "html-languageserver", "--stdio" },
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.jsonls.setup{
                cmd = { "json-languageserver", "--stdio" },
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.rust_analyzer.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.vimls.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.vuels.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.tsserver.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.clangd.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.hls.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.bashls.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.yamlls.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.dhall_lsp_server.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
            nvim_lsp.csharp_ls.setup{
                capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
end})
