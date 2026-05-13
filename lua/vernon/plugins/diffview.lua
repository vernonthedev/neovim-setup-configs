return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
  },

  keys = {
    { "<leader>go", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
    { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
  },

  opts = {},
}
