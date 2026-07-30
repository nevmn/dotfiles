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
        lua_ls = { mason = false },
        marksman = { mason = false },
        neocmake = { mason = false },
        clangd = {
          mason = false,
          cmd = { "clangd19" },
        },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "pint" })
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "stylua" and pkg ~= "shfmt" and pkg ~= "golangci-lint" and pkg ~= "codelldb"
      end, opts.ensure_installed or {})
    end,
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
