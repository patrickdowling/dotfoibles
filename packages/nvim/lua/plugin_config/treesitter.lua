local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then return end

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
