-- Unconfigured miscellaneous plugins
return {
    {
        'RRethy/nvim-base16',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme base16-oceanicnext]]
        end,
    },
    {
        'nvim-lua/plenary.nvim',
        lazy = 'true',
    },
    -- 'tpope/vim-sensible', -> neovim has mostly sensible defaults anyway
    {
        'gpanders/editorconfig.nvim',
        lazy = 'VeryLazy',
    },
}
