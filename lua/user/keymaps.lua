local keymap = vim.keymap.set
local opts = { silent = true }
local expr_opts = { remap = true, expr = true }
local remap_opts = { remap = true }

vim.g.mapleader = ";"

-- LSP Snippets
keymap({ "i", "s" }, "<C-j>",
    function() if vim.fn['vsnip#expandable']() == 1 then return "<Plug>(vsnip-expand)" else return "<C-j>" end end,
    expr_opts)
keymap({ "i", "s" }, "<C-l>",
    function() if vim.fn['vsnip#available'](1) == 1 then return "<Plug>(vsnip-expand-or-jump)" else return "<C-l>" end end
    , expr_opts)
keymap({ "i", "s" }, "<Tab>",
    function() if vim.fn['vsnip#jumpable'](1) == 1 then return "<Plug>(vsnip-jump-next)" else return "<Tab>" end end,
    expr_opts)
keymap({ "i", "s" }, "<S-Tab>",
    function() if vim.fn['vsnip#jumpable'](-1) == 1 then return "<Plug>(vsnip-jump-prev)" else return "<S-Tab>" end end,
    expr_opts)

-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>fc", ":lua require('telescope.builtin').live_grep({ search_dirs = { vim.fn.expand('%:p') } })<CR>",
    opts)
keymap("n", "<leader>cd", ":lua require('telescope').extensions.project.project{}<CR>", opts)

-- Session Manager
keymap("n", "<leader>ss", ":SessionManager save_current_session<CR>", remap_opts)
keymap("n", "<leader>sd", ":SessionManager delete_session<CR>", remap_opts)
keymap("n", "<leader>sl", ":SessionManager load_last_session<CR>", remap_opts)
keymap("n", "<leader>ls", ":SessionManager load_session<CR>", remap_opts)

-- Floaterm
keymap("t", [[\]], [[<C-\><C-n>]], opts)
keymap("n", [[<leader>\]], ":FloatermToggle<CR>", opts)
keymap("n", "<leader>n", ":FloatermNew<CR>", opts)
keymap("n", "<leader>k", ":FloatermKill<CR>", opts)
keymap({ "n", "t" }, "<leader>h", ":FloatermPrev<CR>", opts)
keymap({ "n", "t" }, "<leader>l", ":FloatermNext<CR>", opts)

-- Useful
keymap("n", "<leader>w", ":w<CR>", opts) -- Quick exit
keymap("n", "<leader>q", ":q<CR>", opts) -- Quick save
keymap("n", "0", "^", opts) -- 0 -> First non-blank character
keymap("n", "<CR>", "o<ESC>", opts) -- Create new line without going into insert mode
keymap("n", "<leader><space>", ":noh<CR>", opts) -- Disable highlights
keymap("n", "<C-[>", "<C-o>", opts) -- Jump backwards ([)
keymap("n", "<C-]>", "<C-i>", opts) -- Jump forwards (])
keymap("n", "<Left>", ":lua adjust_font_size(-1)<CR>", opts) -- Decrease font_size
keymap("n", "<Right>", ":lua adjust_font_size(1)<CR>", opts) -- Increase font_size

-- Easy copy/paste from system clipboard
keymap("n", "<leader>y", [["+yy]], opts)
keymap("v", "<leader>y", [["+y<CR>]], opts)
keymap("n", "<leader>p", [["+p]], opts)
keymap({ "n", "v" }, "<leader>P", [["+P]], opts)

-- Easy navigation
keymap({ "t", "i" }, "<A-h>", [[<C-\><C-N><C-w>h]], opts)
keymap({ "t", "i" }, "<A-j>", [[<C-\><C-N><C-w>j]], opts)
keymap({ "t", "i" }, "<A-k>", [[<C-\><C-N><C-w>k]], opts)
keymap({ "t", "i" }, "<A-l>", [[<C-\><C-N><C-w>l]], opts)
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- Move lines using Alt+[nm]
keymap("n", "<A-n>", "mz:m+1<CR>`z", opts)
keymap("n", "<A-m>", "mz:m-2<CR>`z", opts)
keymap("v", "<A-n>", ":m'>+<CR>`<my`>mzgv`yo`z", opts)
keymap("v", "<A-m>", ":m'<-2<CR>`>my`<mzgv`yo`z", opts)
