return {
  { "chrisgrieser/nvim-spider" },

  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
      },
      picker = {
        sources = {
          explorer = {
            hidden = true
          },
          files = {
            --hidden = true
          }
        },
      },
    },
  },
}
