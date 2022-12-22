-- General bindings
vim.g.mapleader = ","

local keymap = vim.keymap

keymap.set('n', '<leader><space>', ':noh<CR>')

-- <F>ile <T>ree
keymap.set('n', '<leader>ft', ':NvimTreeToggle<CR>')

-- Telescope
local telescope_available, telescope = pcall(require, 'telescope.builtin')
if telescope_available then
    keymap.set('n', '<leader>fb', telescope.buffers, {})

    keymap.set('n', '<leader>ff', telescope.find_files, {})
    keymap.set('n', '<leader>fg', telescope.live_grep, {})
end

-- Diagnostics
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<leader>e', vim.diagnostic.open_float)
