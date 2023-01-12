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

-- <F>ile <T>ree
keymap('n', '<leader>ft', ':NvimTreeToggle<CR>')

-- <leader>Find (Telescope)
local telescope_available, telescope = pcall(require, 'telescope.builtin')
if telescope_available then
    keymap('n', '<leader>fb', telescope.buffers, {})

    keymap('n', '<leader>ff', telescope.find_files, {})
    keymap('n', '<leader>fg', telescope.live_grep, {})
    keymap('n', '<leader>?', telescope.oldfiles)

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
