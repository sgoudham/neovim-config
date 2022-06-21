" Enable true colours support
set termguicolors

" For whatever reason, the catppuccin config only works at setup if placed _right_ here 
" Maybe related to --> https://github.com/catppuccin/nvim/issues/136 ?

" Initialise catppuccin
lua << EOF
local catppuccin = require("catppuccin")

catppuccin.setup {
    term_colors = true,
    transparent_background = false,
    styles = {
        comments = "NONE",
        conditionals = "NONE",
 	    loops = "NONE",
 	    functions = "NONE",
 	    keywords = "NONE",
 	    strings = "NONE",
 	    variables = "NONE",
 	    numbers = "NONE",
 	    booleans = "NONE",
 	    properties = "NONE",
 	    types = "NONE",
 	    operators = "NONE",
     },
    integrations = {
        nvimtree = {
            show_root = true
         },
        lsp_trouble = true,
        lsp_saga = true,
        ts_rainbow = true
    }
}

local cp = require("catppuccin.api.colors").get_colors()

catppuccin.remap({
    ErrorMsg = { fg = cp.red, style = "bold" },
    TSProperty = { style = "NONE" },
 	TSInclude = { style = "NONE" },
 	TSOperator = { style = "bold" },
 	TSKeywordOperator = { style = "bold" },
 	TSPunctSpecial = { style = "bold" },
 	TSFloat = { style = "bold" },
 	TSNumber = { style = "bold" },
 	TSBoolean = { style = "bold" },
 	TSConditional = { style = "bold" },
 	TSRepeat = { style = "bold" },
 	TSException = { style = "NONE" },
 	TSConstBuiltin = { style = "NONE" },
 	TSFuncBuiltin = { style = "NONE" },
 	TSTypeBuiltin = { style = "NONE" },
 	TSVariableBuiltin = { style = "NONE" },
 	TSFunction = { style = "NONE" },
 	TSParameter = { style = "NONE" },
 	TSKeywordFunction = { style = "NONE" },
 	TSKeyword = { style = "NONE" },
 	TSMethod = { style = "NONE" },
 	TSNamespace = { style = "NONE" },
 	TSStringRegex = { style = "NONE" },
 	TSVariable = { style = "NONE" },
 	TSTagAttribute = { style = "NONE" },
 	TSURI = { style = "underline" },
 	TSLiteral = { style = "NONE" },
 	TSEmphasis = { style = "NONE" },
 	TSStringEscape = { style = "NONE" },
 	bashTSFuncBuiltin = { fg = cp.red, style = "NONE" },
 	bashTSParameter = { fg = cp.yellow, style = "NONE" },
 	typescriptTSProperty = { fg = cp.lavender, style = "NONE" },
 	cssTSProperty = { fg = cp.yellow, style = "NONE" },
    DiagnosticInfo = { style = "NONE", bg = "NONE" },
    DiagnosticError = { style = "NONE", bg = "NONE" },
    DiagnosticHint = { style = "NONE", bg = "NONE" },
    DiagnosticWarn = { style = "NONE", bg = "NONE" },
})
EOF

" hi TSComment gui=NONE
" hi TSFuncMacro gui=NONE
" hi TSProperty gui=NONE
" hi TSInclude gui=NONE
" hi TSOperator gui=bold
" hi TSKeywordOperator gui=bold
" hi TSPunctSpecial gui=bold
" hi TSFloat gui=bold
" hi TSNumber gui=bold
" hi TSBoolean gui=bold
" hi TSConditional gui=bold
" hi TSRepeat gui=bold
" hi TSException gui=NONE
" hi TSConstBuiltin gui=NONE
" hi TSFuncBuiltin gui=NONE
" hi TSTypeBuiltin gui=NONE
" hi TSVariableBuiltin gui=NONE
" hi TSFunction gui=NONE
" hi TSParameter gui=NONE
" hi TSKeywordFunction gui=NONE
" hi TSKeyword gui=NONE
" hi TSMethod gui=NONE
" hi TSNamespace gui=NONE
" hi TSStringRegex gui=NONE
" hi TSVariable gui=NONE
" hi TSTagAttribute gui=NONE
" hi TSURI gui=underline
" hi TSLiteral gui=NONE
" hi TSEmphasis gui=NONE
" hi TSStringEscape gui=NONE
" hi bashTSFuncBuiltin gui=NONE
" hi bashTSParameter gui=NONE
" hi typescriptTSProperty gui=NONE
" hi cssTSProperty gui=NONE
" hi DiagnosticInfo gui=NONE
" hi DiagnosticError gui=NONE
" hi DiagnosticHint gui=NONE
" hi DiagnosticWarn gui=NONE
"
" Self-explanatory
let g:catppuccin_flavour = "mocha"
colorscheme catppuccin

" Configs that are neater in their own file
for f in split(glob('~\AppData\Local\nvim\configs.d\*.vim'), '\n')
    exe 'source' f
endfor

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

" Remove tabline
set showtabline=0

" See how many lines of history VIM has to remember
set history=500

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the wild menu
set wildmenu

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
" Lots of neovide cursor problems are related to this :(
set lazyredraw

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

" Open new split panes to right and bottom
set splitbelow
set splitright

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Allow dynamically changing font size
let s:guifontsize=9
let s:guifont="JetBrainsMono\\ NF"

fun! AdjustFontSize(amount)
    let s:guifontsize = s:guifontsize + a:amount
    execute "set guifont=" .. s:guifont .. ":h" .. s:guifontsize
endfun

