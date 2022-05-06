local telescope_fzf_native_bin = vim.api.nvim_get_runtime_file('build/libfzf.so', false)
if (#telescope_fzf_native_bin == 0) then
    local telescope_fzf_native_root_path = vim.fn.stdpath('data')
        ..'/site/pack/vendor/start/telescope-fzf-native.nvim/'
    local Job = require('plenary.job')
    Job:new({
        command = 'make',
        cwd = telescope_fzf_native_root_path,
        on_exit = function (j, return_val)
            if (return_val == 0) then
                print('telescope-fzf-native.nvim successfully builded')
                require('telescope').load_extension('fzf')
            else
                error('telescope-fzf-native.nvim not installed')
                error(vim.inspect(j:result()))
            end
        end,
    }):start()
end

require('nvim-treesitter.configs').setup {
  ensure_installed = {"bash", "php", "vue", "typescript", "javascript", "json", "yaml", "html", "regex", "css", "c", "jsdoc", "cpp", "c", "toml"},
  highlight = {
    enable = true,
  },
}

require'colorizer'.setup()

local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }
    }, {
        { name = 'buffer' }
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local nvim_lsp = require('lspconfig')

--nvim_lsp.intelephense.setup { capabilities = capabilities }
nvim_lsp.psalm.setup { capabilities }

nvim_lsp.dockerls.setup { capabilities }

nvim_lsp.cssls.setup { cmd = { "vscode-css-languageserver", "--stdio" }, capabilities }

nvim_lsp.html.setup { cmd = { "vscode-html-languageserver", "--stdio" }, capabilities }

nvim_lsp.jsonls.setup { cmd = { "vscode-json-languageserver", "--stdio" }, capabilities }

nvim_lsp.vimls.setup { capabilities }

nvim_lsp.vuels.setup { capabilities }

nvim_lsp.tsserver.setup { capabilities }

nvim_lsp.clangd.setup { capabilities }

nvim_lsp.hls.setup { capabilities }

nvim_lsp.bashls.setup { capabilities }

nvim_lsp.yamlls.setup { capabilities }

nvim_lsp.csharp_ls.setup { capabilities }

nvim_lsp.pylsp.setup { capabilities }

nvim_lsp.gopls.setup { capabilities }

local sumneko_root_path = vim.fn.stdpath('data')..'/site/pack/packer/start/nvim-lspconfig/lua/lspconfig/sumneko_lua.lua'
nvim_lsp.sumneko_lua.setup {
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
}

