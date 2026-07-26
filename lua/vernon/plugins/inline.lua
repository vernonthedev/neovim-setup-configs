return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        -- Tiny inline diagnostic: shows diagnostic messages inline at the end of each line.
        -- This replaces Neovim's default virtual_text with a cleaner inline display.
        require("tiny-inline-diagnostic").setup({
            options = {
                multilines = {
                    enabled = true,
                    -- Always show ERRORs, show only on cursor line for lower severities
                    always_show = true,
                    severity = { vim.diagnostic.severity.ERROR },
                },
                show_source = {
                    enabled = true,
                },
                add_messages = {
                    display_count = true,
                },
            },
        })

        -- Disable Neovim's default virtual text diagnostics so they don't conflict
        -- with the inline display from tiny-inline-diagnostic.
        vim.diagnostic.config({
            virtual_text = false,
            -- Keep signs and underline for visual feedback in the gutter
            signs = true,
            underline = true,
        })
    end,
}
