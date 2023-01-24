vim.diagnostic.config {
    virtual_text = false, -- hide inline messages
    severity_sort = true,
    signs = true,
    float = {
        border = 'rounded',
        source = 'always',
        -- header = '',
        -- prefix = '',
    },
}

local type_icons = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}
for type, icon in pairs(type_icons) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
