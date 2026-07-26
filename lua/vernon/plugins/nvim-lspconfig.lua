return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Configure vtsls (TypeScript) via Neovim 0.11+ native API.
    -- Mason-lspconfig auto-enables other servers (lua_ls, rust_analyzer, etc.)
    -- but vtsls is excluded from auto-enable in mason.lua so we set it up here.
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

    vim.lsp.enable('vtsls')
  end,
}
