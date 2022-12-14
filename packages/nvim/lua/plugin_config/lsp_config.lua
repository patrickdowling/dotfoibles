local status, mason = pcall(require, "mason")
if not status then
	print "mason not found"
end

mason.setup()

require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "bashls", "clangd" }
})


local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = {'vim'}
			},
		},
	}
})

lspconfig.bashls.setup({})
lspconfig.clangd.setup({})
