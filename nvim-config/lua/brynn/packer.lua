-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use ( {
        "ellisonleao/gruvbox.nvim"  ,
        as = "gruvbox",
        config = function()
            vim.o.background = "dark"
            require("gruvbox").setup({
                overrides = {
                    debugPC = { bg = "#076678" }
                }
            })

            vim.cmd("colorscheme gruvbox")
        end
    })

    use "nvim-tree/nvim-tree.lua"
    use 'nvim-tree/nvim-web-devicons'

    use 'mbbill/undotree'

    use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} )
    use "nvim-treesitter/nvim-treesitter-context"
    use ('nvim-treesitter/playground')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    --use {
        --"windwp/nvim-autopairs"
    --}

    use 'Civitasv/cmake-tools.nvim'
    use 'mfussenegger/nvim-dap'
    use 'tpope/vim-fugitive'
    use "jay-babu/mason-nvim-dap.nvim"
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'folke/neodev.nvim'
    use 'ThePrimeagen/vim-be-good'
    use 'preservim/nerdcommenter'
    use 'ThePrimeagen/harpoon'

    use 'CRAG666/code_runner.nvim'
end)
