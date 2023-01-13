-- General bindings
vim.g.mapleader = ","

local keymap = vim.keymap.set

keymap('n', '<leader><space>', ':noh<CR>')

-- Move selected lines
-- Thanks @theprimeagean!
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("v", "J", ":m '>+1<CR>gv=gv")

-- Better indent
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Window
keymap('n', '<c-h>', '<c-w>h', { desc = 'Move to left window' })
keymap('n', '<c-j>', '<c-w>j', { desc = 'Move to lower window' })
keymap('n', '<c-k>', '<c-w>k', { desc = 'Move to upper window' })
keymap('n', '<c-l>', '<c-w>l', { desc = 'Move to right window' })

-- [T]ree [F]iles
local tree_available, api = pcall(require, 'nvim-tree.api')
if tree_available then
    keymap('n', '<leader>tf', api.tree.toggle)
end

-- <leader>Find (Telescope)
-- TODO I'm now thinking [S]earch may indeed be better?
local telescope_available, telescope = pcall(require, 'telescope.builtin')
if telescope_available then
    keymap('n', '<leader>fb', telescope.buffers, {})

    keymap('n', '<leader>ff', telescope.find_files, {}) -- [F]ind [F]iles
    keymap('n', '<leader>fg', telescope.live_grep, {})
    keymap('n', '<leader>?', telescope.oldfiles)
    keymap('n', '<leader>fl', telescope.resume) -- [F]ind [L]ast

    keymap('n', '<leader>df', telescope.diagnostics)
end

-- <leader>Diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>e', vim.diagnostic.open_float)

local diagnostic_hide = function()
    vim.diagnostic.hide(nil, 0)
end

local diagnostic_show = function()
    vim.diagnostic.show(nil, 0)
end

keymap('n', '<leader>dh', diagnostic_hide) -- LSP Diagnostic Hide (for current buffer)
keymap('n', '<leader>ds', diagnostic_show) -- LSP Diagnostic Show (for current buffer)

-- NOTE There's a bunch of lsp per-buffer mappings set in lsp_config.lua
