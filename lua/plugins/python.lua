return {
  -- 1. (Optional) Ensure pyrefly is automatically installed by Mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "pyrefly")
    end,
  },

  -- 2. Configure LSP: Disable Pyright and Enable Pyrefly
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable Pyright variants and Ruff
        pyright = { enabled = false },
        basedpyright = { enabled = false },
        ruff = { enabled = false },
        ruff_lsp = { enabled = false },

        -- Enable Pyrefly
        pyrefly = {
          enabled = true,
          settings = {
            python = {
              pyrefly = {
                typeCheckingMode = "all",
              },
            },
          },
        },
      },
    },
  },
}
