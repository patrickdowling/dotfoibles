local M = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind.nvim',
    },
    event = "InsertEnter"
}

function M.config()
    local cmp_status, cmp = pcall(require, 'cmp')
    local luasnip_status, luasnip = pcall(require, 'luasnip')
    local lspkind_status, lspkind = pcall(require, 'lspkind')

    if not cmp_status or not luasnip_status then return end

    local next_item = function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end

    local prev_item = function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end

    local formatting = {}
    if lspkind_status then
        formatting.format = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            menu = ({
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                luasnip = "[snip]",
                path = "[path]",
                cmdline = "[cmd]",
            }),
        }
    end

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp', keyword_length = 2 },
            { name = 'luasnip', keyword_length = 3 },
        }, {
            { name = 'buffer', keyword_length = 2 },
        }),
        formatting = formatting,
        mapping = cmp.mapping.preset.insert {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
            ['<Tab>'] = cmp.mapping(next_item, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(prev_item, { 'i', 's' }),
        },
    }

    -- These might be overkill...

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer', keyword_length = 3 }
        }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline', keyword_length = 2 }
        })
    })
end

return M
