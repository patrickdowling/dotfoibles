local status, mason = pcall(require, "mason")
if not status then
    return
end

mason.setup()
require("mason-lspconfig").setup({
	ensure_installed = { "ansiblels", "bashls", "clangd", "sumneko_lua" }
})

local lspconfig = require("lspconfig")

lspconfig.ansiblels.setup({})
lspconfig.bashls.setup({})
lspconfig.clangd.setup({})
lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = {'vim'}
			},
		},
	}
})

