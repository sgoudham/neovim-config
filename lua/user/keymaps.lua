local map = vim.keymap.set
local opts = { silent = true }
local expr_opts = { remap = true, expr = true }
local remap_opts = { remap = true }

vim.g.mapleader = ";"

-- Neovide toggle fullscreen
map("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", opts)

-- Undotree
map("n", "<leader>ut", ":UndotreeToggle<CR>", opts)

-- LSP Snippets
map({ "i", "s" }, "<C-j>",
    function() if vim.fn['vsnip#expandable']() == 1 then return "<Plug>(vsnip-expand)" else return "<C-j>" end end,
    expr_opts)
map({ "i", "s" }, "<C-l>",
    function() if vim.fn['vsnip#available'](1) == 1 then return "<Plug>(vsnip-expand-or-jump)" else return "<C-l>" end end
    , expr_opts)
map({ "i", "s" }, "<Tab>",
    function() if vim.fn['vsnip#jumpable'](1) == 1 then return "<Plug>(vsnip-jump-next)" else return "<Tab>" end end,
    expr_opts)
map({ "i", "s" }, "<S-Tab>",
    function() if vim.fn['vsnip#jumpable'](-1) == 1 then return "<Plug>(vsnip-jump-prev)" else return "<S-Tab>" end end,
    expr_opts)

-- NvimTree
map("n", "<space>n", ":NvimTreeToggle<CR>", opts)

-- Telescope
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", opts)
map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", opts)
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", opts)
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", opts)
map("n", "<leader>fc", ":lua require('telescope.builtin').live_grep({ search_dirs = { vim.fn.expand('%:p') } })<CR>",
    opts)
map("n", "<leader>fd", ":lua require('telescope').extensions.project.project{}<CR>", opts)
map("n", "<leader>fn", ":Telescope file_browser<CR>", opts)

-- Session Manager
map("n", "<leader>ss", ":SessionManager save_current_session<CR>", remap_opts)
map("n", "<leader>sd", ":SessionManager delete_session<CR>", remap_opts)
map("n", "<leader>sl", ":SessionManager load_last_session<CR>", remap_opts)
map("n", "<leader>ls", ":SessionManager load_session<CR>", remap_opts)

-- Floaterm
map("t", [[\]], [[<C-\><C-n>]], opts)
map("n", [[<leader>\]], ":FloatermToggle<CR>", opts)
map("n", "<leader>n", ":FloatermNew<CR>", opts)
map("n", "<leader>k", ":FloatermKill<CR>", opts)
map({ "n", "t" }, "<leader>h", ":FloatermPrev<CR>", opts)
map({ "n", "t" }, "<leader>l", ":FloatermNext<CR>", opts)

-- Useful
map("n", "<leader>w", ":w<CR>", opts) -- Quick save
map("n", "<leader>q", ":q<CR>", opts) -- Quick exit
map("n", "0", "^", opts) -- 0 -> First non-blank character
map("n", "<CR>", "o<ESC>", opts) -- Create new line without going into insert mode
map("n", "<leader><space>", ":noh<CR>", opts) -- Disable highlights
map("n", "<space>[", ":lua adjust_font_size(-1)<CR>", opts) -- Decrease font_size
map("n", "<space>]", ":lua adjust_font_size(1)<CR>", opts) -- Increase font_size

-- Easy copy/paste from system clipboard
map("n", "<leader>y", [["+yy]], opts)
map("v", "<leader>y", [["+y<CR>]], opts)
map("n", "<leader>p", [["+p]], opts)
map({ "n", "v" }, "<leader>P", [["+P]], opts)

-- Easy navigation
map({ "t", "i" }, "<A-h>", [[<C-\><C-N><C-w>h]], opts)
map({ "t", "i" }, "<A-j>", [[<C-\><C-N><C-w>j]], opts)
map({ "t", "i" }, "<A-k>", [[<C-\><C-N><C-w>k]], opts)
map({ "t", "i" }, "<A-l>", [[<C-\><C-N><C-w>l]], opts)
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

-- Move lines using Alt+[nm]
map("n", "<A-n>", "mz:m+1<CR>`z", opts)
map("n", "<A-m>", "mz:m-2<CR>`z", opts)
map("v", "<A-n>", ":m'>+<CR>`<my`>mzgv`yo`z", opts)
map("v", "<A-m>", ":m'<-2<CR>`>my`<mzgv`yo`z", opts)
