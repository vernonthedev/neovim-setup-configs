return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = { "Spectre" },
  keys = {
    {
      "<leader>S",
      '<cmd>lua require("spectre").toggle()<CR>',
      desc = "Toggle Spectre (Project Search & Replace)",
    },
    {
      "<leader>sw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      desc = "Search current word in project",
    },
  },
  opts = {
    open_cmd = "tabnew",
    mapping = {
      ["run_replace"] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "Run replace all",
      },
      ["run_current_file_replace"] = {
        map = "<leader>rc",
        cmd = "<cmd>lua require('spectre.actions').run_current_file_replace()<CR>",
        desc = "Replace all in current file",
      },
    },
  },
}
