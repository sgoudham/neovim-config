call plug#begin('~\AppData\Local\nvim\plugged')

" Plugins that are neater in their own file
for f in split(glob('~\AppData\Local\nvim\plugins.d\*.vim'), '\n')
    exe 'source' f
endfor

" Discord RPC
Plug 'andweeb/presence.nvim'

" Autosave 
Plug 'Pocco81/AutoSave.nvim'

" Allows for easy surrounding of text
Plug 'tpope/vim-surround'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

" File Explorer
Plug 'scrooloose/NERDTree'

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()