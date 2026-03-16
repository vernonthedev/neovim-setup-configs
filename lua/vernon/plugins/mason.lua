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
        "rust_analyzer",
        "astro",
        "marksman",     -- MDX/Markdown
        "lua_ls",       -- Neovim config
        "tailwindcss",  
        "intelephense", -- Laravel/PHP
      },
    })
  end,
}
