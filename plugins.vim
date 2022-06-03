call plug#begin('~\AppData\Local\nvim\plugged')

" Plugins that are neater in their own file
for f in split(glob('~\AppData\Local\nvim\plugins.d\*.vim'), '\n')
    exe 'source' f
endfor

" Much better terminal experience within nvim
Plug 'voldikss/vim-floaterm'

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'cljoly/telescope-repo.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Ensure root directory is selected
Plug 'airblade/vim-rooter'

" Mimic tabs within IDE's
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

call plug#end()
