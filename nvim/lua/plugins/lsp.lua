return {
  --tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "pyright",
        "black",
        "isort",
        "mypy",

        "bash-language-server",
        "shellcheck",
        "shfmt",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        bashls = {},
      },
    },
  },
}
