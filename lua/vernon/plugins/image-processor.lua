return {
    "3rd/image.nvim",
    build = false,
    dependencies = { }, 
    config = function()
      require("image").setup({
        backend = "kitty", 
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki", "quarto" },
          },
        },
        max_width = 100,
        max_height = 12,
        window_overlap_clear_enabled = true,
      })
    end,
  }
