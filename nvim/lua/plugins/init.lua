local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('config')..'/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd('packadd packer.nvim')
local packer = require('packer')
packer.init({
    package_root = vim.fn.stdpath('config')..'/pack',
    display = {
        open_fn = function()
            return require('packer.util').float()
        end
    }
})

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- ui
    use {
        'mhinz/vim-startify',
        event = 'VimEnter',
        config = function() require('plugins.vim-startify') end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.lualine') end
    }
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.bufferline') end
    }
    use {
        'luochen1990/rainbow',
        config = function() vim.g.rainbow_active = 1 end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('indent_blankline').setup() end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('plugins.gitsigns') end
    }
    use {
        'APZelos/blamer.nvim',
        config = function() vim.g.blamer_enabled = 1 end
    }
    use {
        'morhetz/gruvbox',
        event = 'VimEnter',
        config = function() vim.cmd([[colorscheme gruvbox]]) end
    }

    -- coding
    use 'terryma/vim-expand-region'
    use 'tpope/vim-surround'
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }

    -- auto cmp
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'ray-x/lsp_signature.nvim',
            'simrat39/symbols-outline.nvim',

            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-calc',
            {
                'saadparwaiz1/cmp_luasnip',
                requires = {
                    'L3MON4D3/LuaSnip',
                    'rafamadriz/friendly-snippets',
                    'honza/vim-snippets',
                },
            },
            'onsails/lspkind.nvim',

            'williamboman/mason.nvim',
        },
        config = function() require('plugins.nvim-lsp') end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require('plugins.nvim-treesitter') end
    }

    -- misc
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('todo-comments').setup() end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.nvim-tree') end
    }
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('plugins.diffview') end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            },
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function() require('plugins.telescope') end
    }
    use {
        'easymotion/vim-easymotion',
        config = function() require('plugins.vim-easymotion') end
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function() require('plugins.toggleterm') end
    }
    use 'lewis6991/impatient.nvim'
    if packer_bootstrap then
        packer.sync()
    end
end)

