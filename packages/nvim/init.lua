-- The installer symlinks the whole .config/nvim directory, so this is now longer necessary
--local dotfiles = vim.fn.expand("$HOME") .. "/.dotfiles"
--package.path = dotfiles .. "/packages/nvim/lua/?.lua;" .. package.path

local g = vim.g

-- Disable distribution plugins
-- Needs more research
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

g.loaded_spellfile_plugin = 1

g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1

g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

require('core.plugins')
require('core.options')
require('core.autocmds')
require('core.keymaps')
require('plugin_config.lualine')
require('plugin_config.nvim-tree')
require('plugin_config.telescope')
require('plugin_config.treesitter')
require('plugin_config.lsp_config')
require('plugin_config.nvim-cmp')
require('core.colorscheme')
