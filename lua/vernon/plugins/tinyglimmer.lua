return {
    "rachartier/tiny-glimmer.nvim",
    event = "VeryLazy",
    priority = 10,

    config = function()
        require("tiny-glimmer").setup({
            enabled = true,

            disable_warnings = true,

            autoreload = true,

            refresh_interval_ms = 8,

            text_change_batch_timeout_ms = 50,

            overwrite = {
                auto_map = true,

                yank = {
                    enabled = true,
                    default_animation = "rainbow",
                },

                paste = {
                    enabled = true,
                    default_animation = "reverse_fade",
                },

                search = {
                    enabled = true,
                    default_animation = "pulse",
                    next_mapping = "n",
                    prev_mapping = "N",
                },

                undo = {
                    enabled = true,
                    default_animation = {
                        name = "fade",
                        settings = {
                            from_color = "DiffDelete",
                            max_duration = 500,
                            min_duration = 500,
                        },
                    },
                    undo_mapping = "u",
                },

                redo = {
                    enabled = true,
                    default_animation = {
                        name = "fade",
                        settings = {
                            from_color = "DiffAdd",
                            max_duration = 500,
                            min_duration = 500,
                        },
                    },
                    redo_mapping = "<C-r>",
                },
            },

            presets = {
                pulsar = {
                    enabled = true,
                    on_events = {
                        "CursorMoved",
                        "CmdlineEnter",
                        "WinEnter",
                    },
                    default_animation = {
                        name = "fade",
                        settings = {
                            max_duration = 1000,
                            min_duration = 1000,
                            from_color = "DiffDelete",
                            to_color = "Normal",
                        },
                    },
                },
            },

            animations = {
                fade = {
                    max_duration = 400,
                    min_duration = 300,
                    easing = "outQuad",
                    chars_for_max_duration = 10,
                    from_color = "Visual",
                    to_color = "Normal",
                    font_style = {},
                },

                reverse_fade = {
                    max_duration = 380,
                    min_duration = 300,
                    easing = "outBack",
                    chars_for_max_duration = 10,
                    from_color = "Visual",
                    to_color = "Normal",
                    font_style = {},
                },

                bounce = {
                    max_duration = 500,
                    min_duration = 400,
                    chars_for_max_duration = 20,
                    oscillation_count = 2,
                    from_color = "Visual",
                    to_color = "Normal",
                    font_style = {},
                },

                left_to_right = {
                    max_duration = 350,
                    min_duration = 350,
                    min_progress = 0.85,
                    chars_for_max_duration = 25,
                    lingering_time = 50,
                    from_color = "Visual",
                    to_color = "Normal",
                    font_style = {},
                },

                pulse = {
                    max_duration = 600,
                    min_duration = 400,
                    chars_for_max_duration = 15,
                    pulse_count = 3,
                    intensity = 1.2,
                    from_color = "Visual",
                    to_color = "Normal",
                    font_style = {},
                },

                rainbow = {
                    max_duration = 600,
                    min_duration = 350,
                    chars_for_max_duration = 20,
                    font_style = {},
                },

                custom = {
                    max_duration = 350,
                    chars_for_max_duration = 40,

                    color = "#ff0000",

                    effect = function(self, progress)
                        return self.settings.color, progress
                    end,
                },
            },

            virt_text = {
                priority = 2048,
            },

            hijack_ft_disabled = {
                "alpha",
                "snacks_dashboard",
            },
        })

        -- Optional keybindings
        vim.keymap.set(
            "n",
            "<leader>ge",
            "<cmd>TinyGlimmer enable<CR>",
            { desc = "Enable tiny glimmer" }
        )

        vim.keymap.set(
            "n",
            "<leader>gd",
            "<cmd>TinyGlimmer disable<CR>",
            { desc = "Disable tiny glimmer" }
        )

        vim.keymap.set(
            "n",
            "<leader>gt",
            "<cmd>TinyGlimmer fade<CR>",
            { desc = "Use fade animation" }
        )
    end,
}
