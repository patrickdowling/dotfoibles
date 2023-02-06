M = {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'RRethy/nvim-base16',
    },
    event = 'VeryLazy'
}

function M.config()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'auto'
        },
        extensions = {
            'quickfix',
            'nvim-tree',
        }
    }
end

return M
