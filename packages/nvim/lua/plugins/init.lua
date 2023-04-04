-- Unconfigured miscellaneous plugins
return {
    {
        'RRethy/nvim-base16',
        lazy = false,
        priority = 1000,
        config = function()
            require('base16-colorscheme').with_config({
                telescope_borders = true,
            })
            vim.cmd [[colorscheme base16-oceanicnext]]
        end,
    },
    {
        'nvim-lua/plenary.nvim',
        lazy = 'true',
    },
    -- 'tpope/vim-sensible', -> neovim has mostly sensible defaults anyway
    -- NOTE Neovim 0.9 has EditorConfig integration builtin, so this plugin is no longer necessary
    {
        'gpanders/editorconfig.nvim',
        event = 'BufReadPre',
        cond = (0 == vim.fn.has('nvim-0.9')),
    },
}
