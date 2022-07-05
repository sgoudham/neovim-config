call plug#begin('~\AppData\Local\nvim\plugged')

" Plugins that are neater in their own file
for f in split(glob('~\AppData\Local\nvim\plugins.d\*.vim'), '\n')
    exe 'source' f
endfor

" Much better terminal experience within nvim
Plug 'voldikss/vim-floaterm'

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" Ensure root directory is selected
Plug 'airblade/vim-rooter'

" Much better terminal experience within nvim
Plug 'voldikss/vim-floaterm'

" Nice startup dashboard
Plug 'glepnir/dashboard-nvim'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'cljoly/telescope-repo.nvim', { 'branch': 'dev' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Very nice UI's
Plug 'stevearc/dressing.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()
