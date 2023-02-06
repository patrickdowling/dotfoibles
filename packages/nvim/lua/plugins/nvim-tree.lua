local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
}

function M.config()
    require('nvim-tree').setup {
        renderer = {
            full_name = true,
            group_empty = true,
            icons = {
                git_placement = "signcolumn",
                show = {
                    file = true,
                    folder = false,
                    folder_arrow = true,
                    git = true,
                },
            }
        },
        view = {
            width = 50
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    }
end

return M
