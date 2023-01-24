local M = {}

function M.setup()
    local actions = require('telescope.actions')
    local telescope = require('telescope')

    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = actions.close -- close immediately instead of mode change
                },
            },
        }
    }

    telescope.load_extension('fzf')
end

return M
