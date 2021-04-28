vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function ()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    --use 'preservim/nerdtree'
    use 'kyazdani42/nvim-tree.lua'
end)
