" Dynamically change font size with arrow keys
nnoremap <Left> :call AdjustFontSize(-1)<CR>
nnoremap <Right> :call AdjustFontSize(+1)<CR>

" LSP
nnoremap <silent> fc        :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> K         :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k>     :lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gs        :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        :lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0        :lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW        :lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd        :Lspsaga lsp_finder<CR>
nnoremap <silent> gD        :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga        :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <space>e  :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [d        :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d        :lua vim.diagnostic.goto_next()<CR>
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Session manager
nmap <Leader>ss :SessionManager save_current_session<CR>
nmap <Leader>sd :SessionManager delete_session<CR>
nmap <Leader>sl :SessionManager load_last_session<CR>
nmap <Leader>ls :SessionManager load_session<CR>

" Telescope
nnoremap <leader>fb :lua require("telescope.builtin").buffers()<CR>
nnoremap <leader>fh :lua require("telescope.builtin").help_tags()<CR>
nnoremap <leader>ff :lua require("telescope.builtin").find_files()<CR>
" Find string over entire project directory
nnoremap <leader>fg :lua require("telescope.builtin").live_grep()<CR>
" Find string over the current file
nnoremap <leader>fc :lua require("telescope.builtin").live_grep({ search_dirs = { vim.fn.expand("%:p") } })<CR>
" Telescope project
nnoremap <leader>cd :lua require'telescope'.extensions.project.project{}<CR>

" Lspsaga 
nnoremap <silent> <space><space>    :Lspsaga code_action<CR>
vnoremap <silent> <space><space>    :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> <leader>r         :Lspsaga rename<CR>

" NvimTree
nnoremap <C-n> :NvimTreeToggle<CR>

" Floaterm
nnoremap <silent> <leader>n :FloatermNew<CR>
nnoremap <silent> <leader>k :FloatermKill<CR>
nnoremap <silent> <leader>h :FloatermPrev<CR>
tnoremap <silent> <leader>h :FloatermPrev<CR>
nnoremap <silent> <leader>l :FloatermNext<CR>
tnoremap <silent> <leader>l :FloatermNext<CR>
nnoremap <silent> <leader>\ :FloatermToggle<CR>
tnoremap <silent> \ <C-\><C-n>

" Rust tools
nnoremap <leader>t :RustRunnables<CR>
nnoremap <A-i> :RustToggleInlayHints<CR>

" Quick save
nnoremap <leader>w :w<CR>

" Quick exit
nnoremap <leader>q :q<CR>

" 0 -> first non-blank character
nnoremap 0 ^

" Easy copy/paste from the system clipboard
nnoremap <leader>y "+yy
vnoremap <leader>y "+y<CR>
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Create new line without going into INSERT mode
nnoremap <silent> <CR> o<ESC>

" Jump backwards ([) and forwards (])
nnoremap <silent> <C-[> <C-o>
nnoremap <silent> <C-]> <C-i>

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

" Shortcutting split navigation from _any_ mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Close all the buffers except the current one
nnoremap <leader>c :BufOnly<CR>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Reload NeoVim config
nnoremap <silent> \\ :call SourceConfig()<cr>

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
