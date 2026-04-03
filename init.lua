require("options")
require("lazyplugin")

-- Setup a custom FZF-Lua spelllang picker
local fzf = require('fzf-lua')

-- Define spell languages
local spelllangs = {
  ["English"] = "en",
  ["Swedish"] = "sv",
 ["English + Swedish"] = "en,sv"
}

-- Function to select and set spelllang
local function select_spelllang()
  fzf.fzf_exec(vim.tbl_keys(spelllangs), {
    prompt = 'Select spelllang> ',
    previewer = false,
    actions = {
      ['default'] = function(selected)
        local lang = spelllangs[selected[1]]
        if lang then
          vim.opt.spelllang = lang
          vim.opt.spell = true
          print("Spelllang set to: " .. lang)
        else
          print("Invalid selection")
        end
      end
    }
  })
end

-- Keymap to <leader>fs
vim.keymap.set('n', '<leader>fs', select_spelllang, { desc = "FZF: Select spelllang" })


-- local colemak_sv = {
--   -- Top row
--   ["e"] = "f", ["E"] = "F",
--   ["r"] = "p", ["R"] = "P",
--   ["t"] = "g", ["T"] = "G",
--   ["y"] = "j", ["Y"] = "J",
--   ["u"] = "l", ["U"] = "L",
--   ["i"] = "u", ["I"] = "U",
--   ["o"] = "y", ["O"] = "Y",
--   ["p"] = "ö", ["P"] = "Ö",
--
--   -- Home row
--   ["s"] = "r", ["S"] = "R",
--   ["d"] = "s", ["D"] = "S",
--   ["f"] = "t", ["F"] = "T",
--   ["g"] = "d", ["G"] = "D",
--   ["j"] = "n", ["J"] = "N",
--   ["k"] = "e", ["K"] = "E",
--   ["l"] = "i", ["L"] = "I",
--   ["ö"] = "o", ["Ö"] = "O",
--
--   -- Bottom row
--   ["n"] = "k", ["N"] = "K",
-- }
--
-- for from, to in pairs(colemak_sv) do
--   vim.keymap.set("i", from, to, { noremap = true })
-- end

package.path = "/nix/store/wc7ppv1z8z3qyz3pn66mj5544f73j7vb-luajit-2.1.1741730670-env/share/lua/5.1/?.lua;/nix/store/wc7ppv1z8z3qyz3pn66mj5544f73j7vb-luajit-2.1.1741730670-env/share/lua/5.1/?/init.lua".. ";" .. package.path
package.cpath = "/nix/store/wc7ppv1z8z3qyz3pn66mj5544f73j7vb-luajit-2.1.1741730670-env/lib/lua/5.1/?.so".. ";" .. package.cpath

vim.g.loaded_node_provider=0;vim.g.loaded_perl_provider=0;vim.g.loaded_ruby_provider=0;vim.g.python3_host_prog='/nix/store/mmnm32w0fnzz0z39sqri6z3wdrcg458x-nvim-host-python3-3.13.12-env/bin/nvim-python3'
