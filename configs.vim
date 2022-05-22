" Configs that are neater in their own file
for f in split(glob('~\AppData\Local\nvim\configs.d\*.vim'), '\n')
    exe 'source' f
endfor

" Enable true colors support
set termguicolors

" Self-explanatory
colorscheme catppuccin

" Enable syntax highlighting
syntax on

" http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set timeoutlen=200 

" Enable relative line numbers
set number relativenumber

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Always show current position
set ruler

" Always show the status line
set laststatus=3
set noshowmode

" Remove file name at the top
set showtabline=0

" See how many lines of history VIM has to remember
set history=500

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the wild menu
set wildmenu

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
" Lots of neovide cursor problems are related to this :(
" set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Middle mouse paste 
set mouse=v

" Enable mouse click
set mouse=a

" How many tenths of a second to blink when matching brackets
set mat=2

" Speed up scrolling in Vim 
set ttyfast 

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
