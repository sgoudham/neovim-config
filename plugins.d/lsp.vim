" NeoVim LSP client
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" Completion sources
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'

" Enable rust inlay hints & more
Plug 'simrat39/rust-tools.nvim', { 'branch': 'modularize_and_inlay_rewrite' }
