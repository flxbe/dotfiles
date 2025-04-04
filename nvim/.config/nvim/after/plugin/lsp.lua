-- Global mappings.

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- TODO: Is this plugin still necessary?
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })

    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('<leader>f', vim.lsp.buf.format, '[F]ormat')

    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
end)

-- TODO: Dump this in favor of using the globally available installation of each LSP (which opens up the possibility to
-- use a local installation e.g. in python virtual-envs).
require('mason').setup({
    ui = {
        border = 'rounded'
    }
})
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "ruff",
        "rust_analyzer",
        "ts_ls",
        "efm",
        -- "gopls",
    },
    handlers = {
        lsp.default_setup,
    },
})

-- register global variable `vim` to avoid warnings when editing the lua files
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').gopls.setup({
    filetypes = { "go", "gomod", "gowork", "gohtml", "gotmpl", "go.html", "go.tmpl" },
})

require('lspconfig').ruff.setup({
    on_attach = function(client, bufnr)
        if client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end
})

require('lspconfig').pyright.setup {
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
    },
}

require('lspconfig').biome.setup({
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = { new_root_dir .. "/node_modules/.bin/biome", "lsp-proxy" }
    end,
})

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
    filetypes = { "css", "html", "handlebars", "htmldjango" },
    settings = {
        languages = {
            html = { prettier },
            css = { prettier },
            handlebars = { prettier },
            htmldjango = { prettier },
        }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
