-- Variables
local opts = { noremap=true, silent=true }
local keymap = vim.keymap.set
local bufopts = { noremap=true, silent=true, buffer=bufnr }

local lsp_flags = {
    debounce_text_changes = 150,  -- Set debounce time for change events
}


require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright" }
})

-- Mappings
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
    keymap("n", "gd", vim.lsp.buf.definition, bufopts)
    keymap("n", "K", vim.lsp.buf.hover , bufopts)
    keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    keymap("n", "gt", vim.lsp.buf.type_definition, bufopts)

end

require("lspconfig").rust_analyzer.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ["rust-analyzer"] = {
            assist = { importGranularity = "module", importPrefix = "self" },
            cargo = { loadOutDirsFromCheck = true },
            procMacro = { enable = true },
        },
    },
}


-- Python
require("lspconfig")["pyright"].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ["pyright"] = {}
    }
}

require("lspconfig")["lua_ls"].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ["lua-language-server"] = {},
        Lua = {
            telemetry = { enable = false },
            completion = {
                callSnippet = "Replace",
            }
        }
    }
}

-- Bash
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})

