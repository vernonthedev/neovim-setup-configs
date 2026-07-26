return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    
    -- Mason-lspconfig sets up automatic server installation
    require("mason-lspconfig").setup({
      ensure_installed = { "vtsls" }, -- or "ts_ls"
    })

    -- Configure vtsls directly via vim.lsp.config
    vim.lsp.config('vtsls', {
      cmd = { 'vtsls', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      root_markers = { 'tsconfig.json', 'package.json', '.git' },
      settings = {
        typescript = {
          inlayHints = {
            parameterNames = { enabled = "all" },
            variableTypes = { enabled = true },
          },
        },
      },
    })

    -- Enable the server for current and future buffers
    vim.lsp.enable('vtsls')
  end,
}
