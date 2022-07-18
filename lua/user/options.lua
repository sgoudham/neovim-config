local guifont = "OperatorMono"
local nerd_font = "NF"
local size = 11

vim.g.neovide_cursor_trail_length = 0 -- Remove neovide cursor trail
vim.g.neovide_cursor_animation_length = 0 -- Remove neovide cursor animation

vim.opt.guifont = guifont .. " " .. nerd_font .. ":h" .. size -- Set guifont for graphical neovim applications

vim.opt.termguicolors = true -- Enable support for true colours

vim.opt.timeoutlen = 400 -- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
vim.opt.updatetime = 300 -- 300ms of no cursor movement to trigger CursorHold

vim.opt.number = true -- Enable relative line numbers
vim.opt.relativenumber = true

vim.opt.smartcase = true -- When searching, try to be smart about cases
vim.opt.incsearch = true -- Incrementally highlight characters when searching
vim.opt.hlsearch = true -- Highlight search results

vim.opt.ruler = true -- Always show the current cursor position

vim.opt.laststatus = 3 -- Always show the status line
vim.opt.showmode = false -- Hide current mode from the status line

vim.opt.showtabline = 0 -- Hide the tabline

vim.opt.history = 500 -- Specify number of lines for Neovim to remember

vim.opt.wildmenu = true -- Enable wildmenu
vim.opt.wildignore = [[*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store]] -- Ignore compiled files

vim.opt.cmdheight = 1 -- Set the height of the command bar

vim.opt.hidden = true -- Hide buffer when it is abandoned

vim.opt.backspace = [[eol,start,indent]] -- Configre backspace so it acts as it should act
vim.opt.whichwrap:append("<,>,h,l") -- Allow specified keys to move between newlines

vim.opt.lazyredraw = true -- Don't redraw when executing macros (good performance config)

vim.opt.magic = true -- Enable magic for regular expressions

vim.opt.showmatch = true -- Highlight matching brackets when cursor is over them

vim.opt.mouse = "a" -- Support mouse click

vim.opt.matchtime = 2 -- Tenths of a second to blink when matching brackets

vim.opt.ttyfast = true -- Speed up scrolling in Neovim

vim.opt.errorbells = false -- No annoying sound on errors
vim.opt.visualbell = false

vim.opt.foldcolumn = "1" -- Add extra margin to the left

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smarttab = true -- Be smart when using tabs (configured to use spaces in the line above)

vim.opt.shiftwidth = 4 -- 1 tab == 4 spaces
vim.opt.tabstop = 4

vim.opt.splitbelow = true -- Open new split panes to right and bottom
vim.opt.splitright = true

vim.opt.linebreak = true -- Linebreak on 500 characters
vim.opt.textwidth = 500

vim.opt.autoindent = true -- Auto indent
vim.opt.smartindent = true -- Smart indent
vim.opt.wrap = true -- Wrap lines

vim.opt.conceallevel = 2 -- Hide all concealed text unless it has a custom replacement character

vim.opt.completeopt = [[menuone,noinsert,noselect]] -- Set completeopt to have a better completion experience

vim.opt.shortmess:append("c") -- Avoid showing extra messages when using completion
vim.opt.signcolumn = "yes" -- Have a fixed column for the diagnostics to appear in (Removes jitter when warnings/errors appear)

vim.opt.encoding = "utf8" -- Set UTF8 as standard encoding

vim.opt.backup = false -- Turn backup off, most things should be version controlled
vim.opt.swapfile = false

vim.opt.undodir = [[C:\Users\sgoud\AppData\Local\nvim\.vimdid]] -- Permanent undo
vim.opt.undofile = true

vim.opt.autoread = true -- Set to autoread when file is changed outside of Neovim

-- Trigger 'autoread' when changing buffers
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" }
})
-- Return to last edit position when opening files
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
    pattern = { "*" }
})
-- Quit Neovim if NvimTree is the last window (WARNING: this can fail REALLY BADLY -> https://github.com/kyazdani42/nvim-tree.lua/issues/1368)
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
        end
    end
})
-- Create an autocmd `User PackerCompileDone` to update it every time packer is compiled:
vim.api.nvim_create_autocmd("User", {
    pattern = "PackerCompileDone",
    callback = function()
        vim.cmd "CatppuccinCompile"
        vim.defer_fn(function()
            vim.cmd "colorscheme catppuccin"
        end, 50) -- Debounced for live reloading
    end,
})

function adjust_font_size(amount)
    size = size + amount
    vim.cmd("set guifont=" .. guifont .. "\\ " .. nerd_font .. ":h" .. size)
end
