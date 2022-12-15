-- General bindings
vim.g.mapleader = ","

vim.keymap.set('n', '<leader><space>', ':noh<CR>')

-- <F>ile <T>ree
vim.keymap.set('n', '<leader>ft', ':NvimTreeToggle<CR>')

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
