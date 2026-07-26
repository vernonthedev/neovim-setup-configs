return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstallAll", "MasonLog" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "vtsls",        -- TypeScript (configured manually below)
        "rust_analyzer",
        "astro",
        "marksman",     -- MDX/Markdown
        "lua_ls",       -- Neovim config
        "tailwindcss",
        "intelephense", -- Laravel/PHP
      },
      --- Exclude vtsls from auto-enable because we configure it
      --- manually via vim.lsp.config in nvim-lspconfig.lua.
      --- This avoids a race where mason-lspconfig enables vtsls
      --- before its config is registered.
      automatic_enable = {
        exclude = { "vtsls" },
      },
    })
  end,
}
