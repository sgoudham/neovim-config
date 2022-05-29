call plug#begin('~\AppData\Local\nvim\plugged')

" Plugins that are neater in their own file
for f in split(glob('~\AppData\Local\nvim\plugins.d\*.vim'), '\n')
    exe 'source' f
endfor

" Much better terminal experience within nvim
Plug 'akinsho/toggleterm.nvim'

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Git signs for files
Plug 'lewis6991/gitsigns.nvim'

" Ensure root directory is selected
Plug 'airblade/vim-rooter'

call plug#end()
