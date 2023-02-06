-- The installer symlinks the whole .config/nvim directory

require('core.options')
require('core.plugins')
require('core.autocmds')
require('core.keymaps')
require('core.diagnostic')

-- Note to self: disabling builtin plugins handled by lazy.nvim
-- \sa performance.rtp.disabled_plugins
