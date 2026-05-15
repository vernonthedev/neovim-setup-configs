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
    {
      "<leader>sw",
      '<cmd>lua require("spectre").open_visual()<CR>',
      mode = "v",
      desc = "Search visual selection in project",
    },
    {
      "<leader>sp",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      desc = "Search current word in current file",
    },
  },
  opts = {
    open_cmd = "edit", 
  },
}
