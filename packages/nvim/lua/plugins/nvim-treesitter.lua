local M = {
    'nvim-treesitter/nvim-treesitter',
    build = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end,
    event = "BufReadPost",
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
}

function M.config()
    local treesitter = require('nvim-treesitter.configs')

    treesitter.setup {
        -- or "all", or "maintained"
        ensure_installed = { "bash", "c", "cpp", "help", "lua", "python", "vim" },
        highlight = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<CR>',
                scope_incremental = '<CR>',
                node_incremental = '<TAB>',
                node_decremental = '<S-TAB>',
            }
        }
    }
end

return M
