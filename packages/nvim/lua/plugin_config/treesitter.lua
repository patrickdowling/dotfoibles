local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
	return
end

treesitter.setup({
	-- or "all", or "maintained"
	ensure_installed = { "bash", "c", "cpp", "lua", "vim" },

	--
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
})
