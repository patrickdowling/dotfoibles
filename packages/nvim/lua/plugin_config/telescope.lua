local M = {}

local file_ignore_patterns = {
    "%.DS_Store",
    "%.git/",
    "%.png",
    "%.jpe?g",
    "%.zip",
    "%.pdf",
}


function M.setup()
    local actions = require 'telescope.actions'
    local telescope = require 'telescope'

    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = actions.close -- close immediately instead of mode change
                },
            },
            file_ignore_patterns = file_ignore_patterns,
            pickers = {
                find_files = {
                    follow = true,
                    hidden = true,
                },
                git_files = {
                }
            },
        },
    }

    telescope.load_extension 'fzf'
end

return M
