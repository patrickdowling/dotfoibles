M = {}

function M.setup()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'base16'
        },
        extensions = {
            'quickfix',
            'nvim-tree',
        }
    }
end

return M
