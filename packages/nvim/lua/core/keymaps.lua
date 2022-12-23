-- General bindings
vim.g.mapleader = ","

local map = vim.keymap.set

map('n', '<leader><space>', ':noh<CR>')

-- <F>ile <T>ree
map('n', '<leader>ft', ':NvimTreeToggle<CR>')

-- Telescope
local telescope_available, telescope = pcall(require, 'telescope.builtin')
if telescope_available then
    map('n', '<leader>fb', telescope.buffers, {})

    map('n', '<leader>ff', telescope.find_files, {})
    map('n', '<leader>fg', telescope.live_grep, {})
end

-- Diagnostics
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<leader>e', vim.diagnostic.open_float)
