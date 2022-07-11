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

    -- Autosave
    use { "Pocco81/AutoSave.nvim" }

    -- Impatient
    use { "lewis6991/impatient.nvim" }

    -- Discord RPC
    use { "andweeb/presence.nvim" }

    -- Session Manager
    use { "Shatur/neovim-session-manager" }

    -- Autopairs
    use { "windwp/nvim-autopairs" }

    -- Sandwich
    use { "machakann/vim-sandwich" }

    -- Commentary
    use { "tpope/vim-commentary" }

    -- Vim-rooter
    use { "airblade/vim-rooter" }

    -- Dressing
    use { "stevearc/dressing.nvim" }

    -- Dashboard
    use { "glepnir/dashboard-nvim" }

    -- Themes
    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- File explorer
    use {
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" }
    }
    -- Floaterm
    use { "voldikss/vim-floaterm" }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim"
        }
    }
    use { "nvim-telescope/telescope-project.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- Git
    use { "tpope/vim-fugitive" }
    use { "lewis6991/gitsigns.nvim" }

    -- Markdown (plugin file todo)
    use { "godlygeek/tabular" }
    use { "preservim/vim-markdown" }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use { "p00f/nvim-ts-rainbow" }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/nvim-lsp-installer" }
    use { "ray-x/lsp_signature.nvim" }
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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
