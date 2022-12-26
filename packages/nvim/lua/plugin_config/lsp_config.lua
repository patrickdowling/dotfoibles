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

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup { ensure_installed = vim.tbl_keys(lsp_servers) }
mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            -- capabilities
            -- on_attach
            settings = lsp_servers[server_name]
        }
    end
}
