require('mason').setup({
    ui = {
        border = 'rounded'
    }
})

local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    "pyright",
    "rust_analyzer",
    "tsserver",
    "efm",
})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
end)


-- require('lspconfig').tsserver.setup({
--
-- })

-- register global variable `vim` to avoid warnings when editing the lua files
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local prettier = {
    formatCanRange = true,
    formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
    rootMarkers = {
        'package.json',
    }
}

require("lspconfig").efm.setup({
    timeout = 5000,
    init_options = { documentFormatting = true },
    filetypes = { "typescript", "css", "html", "javascript", "python", "json" },
    settings = {
        languages = {
            typescript = { prettier },
            javascript = { prettier },
            html = { prettier },
            css = { prettier },
            json = { prettier },
            python = {
                {
                    formatCommand = "black --fast --no-color -q -",
                    formatStdin = true,
                    rootMarkers = {
                        'pyproject.toml',
                    }
                }
            }

        }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
