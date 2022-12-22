-- All the pretty plugins

-- Bootstrap packer, as per https://github.com/wbthomason/packer.nvim/blob/master/README.md
local fn = vim.fn
local ensure_packer = function()
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end
    }

    use 'tpope/vim-sensible'
    use 'nvim-lualine/lualine.nvim'
    use 'RRethy/nvim-base16'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    }

    use 'gpanders/editorconfig.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- If bootstrapping, we might also skip the rest of the config.
-- We've used the pcall wrapper mostly though so it should be safe as is.

-- TODO Does PackerCompile apply to our plugin_config/* files as well?
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = '*/nvim/lua/core/plugins.lua'
})
