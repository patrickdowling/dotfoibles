-- All the pretty plugins
-- Still using vim-plug, more neo would be packer

local fn = vim.fn

local ensure_vim_plug = function()
	local install_path = fn.stdpath('data')..'/site/autoload/plug.vim'
	if fn.empty(fn.glob(install_path)) > 0 then
		vim.cmd("silent !sh -c 'curl -fLo "..install_path.." --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'")
		return true
	end
	return false
end
local vim_plug_bootstrap = ensure_vim_plug()

local Plug = fn['plug#']
vim.call('plug#begin')
Plug 'tpope/vim-sensible'
Plug 'nvim-lua/plenary.nvim'

Plug 'RRethy/nvim-base16'

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.0'})

Plug 'nvim-lualine/lualine.nvim'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

if vim_plug_bootstrap then vim.cmd('PlugInstall') end
vim.call('plug#end')
