return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { 
  winopts = {
      height = 0.3,         -- Set the height of the window to 30% of screen
      width = 1.0,          -- Full width of the window
      row = 1.0,            -- Align the window to the bottom of the screen (1.0 is the bottom)
      col = 0.0,            -- Align to the left of the screen (default)
      layout = 'reverse',   -- 'reverse' layout to make results flow upwards
      --preview = { hidden = 'hidden' },
    },
        fzf_opts = {
            ["--layout"] = "reverse-list",
        },
    },

    config = function(_, opts)
        local fzf = require("fzf-lua")
        fzf.setup(opts)

        vim.keymap.set("n", "<leader>ff", function()
            local in_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):match("true")

            if in_git_repo then
                fzf.git_files()
            else
                fzf.files()
            end
        end)
    end,
}
