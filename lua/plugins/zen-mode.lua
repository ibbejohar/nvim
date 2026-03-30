return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader><CR>", ":ZenMode<CR> :PencilToggle<CR>", { desc = "Toggle Zen Mode" })

        require("zen-mode").setup {
            window = {
                backdrop = 0.65,
                width = 80,
                height = 1,
                options = {
                    signcolumn = "yes",
                    number = false,
                    relativenumber = false,
                    cursorline = false,
                }
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                    cmdheight = 0,
                },
                twilight = { enabled = true },
                gitsigns = { enabled = false },
                tmux = { enabled = true },
            },
            on_open = function()
                -- Set Normal background to default (non-transparent)
                vim.api.nvim_set_hl(0, "Normal", { bg = "#0f0f17" }) -- adjust this color to your actual background
                vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0f0f17" })
                -- Optional: also update Float or Pmenu if needed
            end,
            -- Callback when Zen Mode is closed
            on_close = function()
                -- Revert background to transparent
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            end,

        }
    end
}
