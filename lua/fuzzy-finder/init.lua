local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>af', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

require("telescope").setup({
defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})
