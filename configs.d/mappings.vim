" LSP
nnoremap <silent> fc    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gs    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> d[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> d] <cmd>lua vim.diagnostic.goto_next()<CR>

" Rust toggle inlay hints
nnoremap <a-i> :RustToggleInlayHints<cr>

" Lspsaga 
nnoremap <silent> <space><space> :Lspsaga code_action<CR>
vnoremap <silent> <space><space> :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> <leader>r :Lspsaga rename<CR>

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Exit in and out of insert mode easily
inoremap jj <Esc>
inoremap JJ <Esc>

" Quick save
nnoremap <leader>w :w<cr>

" 0 -> first non-blank character
nnoremap 0 ^
" Jump to start and end of line using the home row keys
nnoremap H ^
nnoremap L $

" Disable AutoPairsShortcutJump being bound to ALT+n
let g:AutoPairsShortcutJump = ''
" Move a line of text using ALT+[nm]
nnoremap <A-n> mz:m+1<cr>`z
nnoremap <A-m> mz:m-2<cr>`z
vnoremap <A-n> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <A-m> :m'<-2<cr>`>my`<mzgv`yo`z

" / (search)
nnoremap <space> /
" ? (backwards search)
nnoremap <C-space> ?

" Disable highlights
nnoremap <silent> <leader><space> :noh<cr>

" Shortcutting split navigation
nnoremap <a-h> <C-w>h
nnoremap <a-j> <C-w>j
nnoremap <a-k> <C-w>k
nnoremap <a-l> <C-w>l

" Close all the buffers except the current one
nnoremap <leader>c :BufOnly<CR>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Reload NeoVim config
nnoremap <silent> <Leader><Leader> :call SourceConfig()<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Helper functions
function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

command BufOnly silent! execute "%bd|e#|bd#"

" Auto-reload config
if (!exists('*SourceConfig'))
  function SourceConfig() abort
    source $MYVIMRC
  endfunction
endif