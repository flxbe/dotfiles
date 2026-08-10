-- Global mappings.

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local nmap = function(keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = args.buf, desc = desc })
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
    end,
})


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
    },
})

-- register global variable `vim` to avoid warnings when editing the lua files
vim.lsp.enable("luals")

vim.lsp.config("ruff", {
    on_attach = function(client, bufnr)
        if client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end
})
vim.lsp.enable("ruff")
vim.lsp.enable("rust_analyzer")

vim.lsp.config("pyright", {
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
    },
})
vim.lsp.enable("pyright")

vim.lsp.config("biome", {
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = { new_root_dir .. "/node_modules/.bin/biome", "lsp-proxy" }
    end,
})
vim.lsp.enable("biome")

-- Disable formatting for ts_ls
vim.lsp.config("ts_ls", {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end
})
vim.lsp.enable("ts_ls")

local prettier = {
    formatCanRange = true,
    formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
    rootMarkers = {
        'package.json',
    }
}

vim.lsp.config("efm", {
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
vim.lsp.enable("efm")


vim.diagnostic.config({
    virtual_text = true
})
