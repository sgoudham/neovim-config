require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "java", "rust", "python", "lua" },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    rainbow = {
        enable = true,
        extended_mode = true
    }
}
