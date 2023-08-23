M = {
    'numToStr/Comment.nvim',
    opts = {
    },
    event = 'VeryLazy',
}

function M.config()
    require('Comment').setup()
end

return M
