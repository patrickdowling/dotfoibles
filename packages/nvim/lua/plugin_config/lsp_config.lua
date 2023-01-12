local neodev_status, neodev = pcall(require, "neodev")
if neodev_status then
    neodev.setup()
end

local mason_status, mason = pcall(require, "mason")
if not mason_status then return end

mason.setup()

-- Settings for lsp servers
local lsp_servers = {
    ansiblels = {},
    bashls = {},
    clangd = {},
    sumneko_lua = {
        Lua = {
            --diagnostics = { globals = { 'vim' } } -- Undefined global 'vim'
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

local on_attach = function(_, bufnr)
    local nmap_buffer = function(keys, func, desc)
        if desc then desc = 'LSP: ' .. desc end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap_buffer('<leader>cf', vim.lsp.buf.format, '[C]ode [F]ormat')
    nmap_buffer('<leader>cr', vim.lsp.buf.rename, '[C]ode [R]rename')

    nmap_buffer('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap_buffer('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    nmap_buffer('K', vim.lsp.buf.hover, 'Hover definition')
end

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup { ensure_installed = vim.tbl_keys(lsp_servers) }
mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            -- capabilities
            on_attach = on_attach,
            settings = lsp_servers[server_name]
        }
    end
}
