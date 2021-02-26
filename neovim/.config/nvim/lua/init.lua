local on_attach_vim = function()
  require'completion'.on_attach()
end

local nvim_lsp = require'lspconfig'

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

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"php", "vue", "typescript", "javascript", "json", "yaml", "html", "regex", "css", "c", "jsdoc", "cpp", "toml", "rust", "haskell"},
  highlight = {
    enable = true,
  },
}
