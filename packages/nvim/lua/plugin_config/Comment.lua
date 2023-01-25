local M = {}

function M.setup()

    local status, comment = pcall(require, 'Comment')
    if not status then return end

    comment.setup {
        padding = false,
    }
end

return M
