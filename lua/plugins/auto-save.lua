return {
    "pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            debounce_delay = 1000,
            condition = function(buf)
                local ft = vim.bo[buf].filetype
                local name = vim.api.nvim_buf_get_name(buf)
                local mode = vim.api.nvim_get_mode().mode
                return ft == "norg" and name:match("%.norg$") and not (mode:match("i"))
            end
        })
    end,
}
