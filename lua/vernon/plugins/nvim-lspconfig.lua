return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "vtsls" },
    })

    local lspconfig = require("lspconfig")
    
    -- Configure TypeScript LSP
    lspconfig.vtsls.setup({
      settings = {
        typescript = {
          inlayHints = {
            parameterNames = { enabled = "all" },
            variableTypes = { enabled = true },
          },
        },
      },
    })
  end,
}
