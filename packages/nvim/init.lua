-- We might also just symlink the whole .config/nvim directory
-- instead of messing with this half+half solution
local dotfiles = vim.fn.expand("$HOME").."/.dotfiles"
package.path = dotfiles.."/packages/nvim/lua/?.lua;"..package.path

require('core.plugins')
require('core.opt')
require('core.keymap')
require('core.colorscheme')
require('plugin_config.lualine')
require('plugin_config.nvim-tree')
require('plugin_config.telescope')
require('plugin_config.lsp_config')
