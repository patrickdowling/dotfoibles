-- General bindings
vim.g.mapleader = ","

local keymap = vim.keymap.set

keymap('n', '<leader><space>', ':noh<CR>')

-- Move selected lines
-- Thanks @theprimeagean!
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("v", "J", ":m '>+1<CR>gv=gv")

-- <F>ile <T>ree
keymap('n', '<leader>ft', ':NvimTreeToggle<CR>')

-- Telescope
local telescope_available, telescope = pcall(require, 'telescope.builtin')
if telescope_available then
    keymap('n', '<leader>fb', telescope.buffers, {})

    keymap('n', '<leader>ff', telescope.find_files, {})
    keymap('n', '<leader>fg', telescope.live_grep, {})
end

-- Diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>e', vim.diagnostic.open_float)
