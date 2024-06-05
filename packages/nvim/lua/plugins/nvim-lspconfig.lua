local M = {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim', opts = {}, tag='legacy' },
    },
    event = 'BufReadPre'
}

function M.config()

    local mason = require('mason')
    mason.setup()

    -- Settings for lsp servers
    local lsp_servers = {
        ansiblels = {},
        bashls = {},
        clangd = {},
        cmake = {},
        pyright = {},
        lua_ls = {
            Lua = {
                diagnostics = { globals = { 'vim' } }, -- Undefined global 'vim'
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        }
    }

    local lsp = vim.lsp

    -- nvim-cmp additions
    local capabilities = lsp.protocol.make_client_capabilities()
    local cmp_status, cmp = pcall(require, 'cmp_nvim_lsp')
    if cmp_status then
        capabilities = cmp.default_capabilities(capabilities)
    end


    local on_attach = function(_, bufnr)
        local nmap_buffer = function(keys, func, desc)
            if desc then desc = 'LSP: ' .. desc end
            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap_buffer('<leader>ca', function() lsp.buf.code_action({ apply = true }) end, '[C]ode [A]ction')
        nmap_buffer('<leader>cf', lsp.buf.format, '[C]ode [F]ormat')
        nmap_buffer('<leader>cr', lsp.buf.rename, '[C]ode [R]rename')

        nmap_buffer('<leader>gd', lsp.buf.definition, '[G]oto [D]efinition')
        nmap_buffer('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        nmap_buffer('K', lsp.buf.hover, 'Hover definition')
    end

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup { ensure_installed = vim.tbl_keys(lsp_servers) }
    mason_lspconfig.setup_handlers {
        function(server_name)
            require("lspconfig")[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = lsp_servers[server_name]
            }
        end
    }

    lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
        border = "rounded",
    })
end

return M
