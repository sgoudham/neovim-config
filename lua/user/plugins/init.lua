local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing Packer. Close and reopen Neovim..."
    vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- No config needed
    use { "andweeb/presence.nvim" }
    use { "tpope/vim-commentary" }
    use { "airblade/vim-rooter" }
    use { 'kyazdani42/nvim-web-devicons' }
    use { "tpope/vim-fugitive" }
    use { "godlygeek/tabular" }
    use { "nvim-telescope/telescope-project.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "p00f/nvim-ts-rainbow" }
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/nvim-lsp-installer" }
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-vsnip" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-cmdline" }
    use {
        "hrsh7th/vim-vsnip",
        requires = {
            { "hrsh7th/vim-vsnip-integ", after = "vim-vsnip" }
        }
    }
    use { "simrat39/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" }


    use {
        "Pocco81/AutoSave.nvim",
        config = function()
            require "user.plugins.autosave"
        end
    }
    use {
        "lewis6991/impatient.nvim",
        config = function()
            require "user.plugins.impatient"
        end
    }
    use {
        "Shatur/neovim-session-manager",
        config = function()
            require "user.plugins.session"
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require "user.plugins.autopairs"
        end
    }
    use {
        "kylechui/nvim-surround",
        config = function()
            require "user.plugins.surround"
        end
    }
    use {
        "preservim/vim-markdown",
        config = function()
            require "user.plugins.vim-markdown"
        end
    }
    use {
        "stevearc/dressing.nvim",
        config = function()
            require "user.plugins.dressing"
        end
    }
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "user.plugins.lsp-signature"
        end
    }
    use {
        "glepnir/dashboard-nvim",
        config = function()
            require "user.plugins.dashboard"
        end
    }
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        run = ":CatppuccinCompile",
        config = function()
            require "user.plugins.colourscheme"
        end
    }
    use {
        "nvim-lualine/lualine.nvim",
        config = function()
            require "user.plugins.lualine"
        end
    }
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require "user.plugins.nvim-tree"
        end
    }
    use {
        "voldikss/vim-floaterm",
        config = function()
            require "user.plugins.floaterm"
        end
    }
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzf-native.nvim"
        },
        config = function()
            require "user.plugins.telescope"
        end
    }
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require "user.plugins.gitsigns"
        end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        after = "catppuccin",
        config = function()
            require "user.plugins.treesitter"
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
