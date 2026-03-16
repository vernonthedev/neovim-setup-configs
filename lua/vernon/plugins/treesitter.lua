return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status then
      vim.cmd("TSUpdate")
      return
    end

    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "json", "javascript", "typescript", "tsx", "yaml", "html",
        "css", "prisma", "markdown", "markdown_inline", "lua",
        "bash", "vim", "dockerfile", "gitignore", "php", "rust",
        "go", "sql", "python"
      },
    })
  end,
}
