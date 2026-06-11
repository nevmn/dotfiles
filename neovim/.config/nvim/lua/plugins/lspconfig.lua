return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        --intelephense = {
        --	settings = {
        --		intelephense = {
        --			format = {
        --				braces = "k&r",
        --			},
        --		},
        --	},
        --},
        phpactor = { mason = false },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pint",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "pint" },
      },
    },
  },

  {
    "rluba/jai.vim",
  },
}
