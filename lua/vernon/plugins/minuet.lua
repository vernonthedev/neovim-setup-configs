return {
  "milanglacier/minuet-ai.nvim",
  event = "InsertEnter",
  config = function()
    require("minuet").setup({
      provider = "openai_compatible",
      provider_options = {
        openai_compatible = {
          -- OpenCode Zen OpenAI-compatible endpoint
          end_point = "https://opencode.ai/zen/v1/chat/completions",
          api_key = os.getenv("OPENCODE_API_KEY"),
          model = "deepseek-v4-flash-free",
          optional = {
            max_tokens = 256,
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = { "typescript", "javascript", "go", "rust", "lua", "python" },
        keymap = {
          accept = "<A-a>",      -- Alt + a to accept inline completion
          accept_line = "<A-l>", -- Alt + l to accept a single line
          prev = "<A-[>",        -- Alt + [ for previous suggestion
          next = "<A-]>",        -- Alt + ] for next suggestion
          dismiss = "<A-e>",     -- Alt + e to dismiss
        },
      },
    })
  end,
}
