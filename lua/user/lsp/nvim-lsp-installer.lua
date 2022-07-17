local servers = {
    -- "rust_analyzer", Special case: use rust-tools.nvim
    "vimls",
    "jsonls",
    "marksman",
    "sumneko_lua"
}

-- Always make sure to include this at the BEGINNING
require("nvim-lsp-installer").setup {
    ensure_installed = servers
}

local lsp_config = require("lspconfig")

local opts = {}
for _, server in pairs(servers) do
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities
    }

    local require_ok, conf_opts = pcall(require, "user.lsp.servers." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lsp_config[server].setup(opts)
end

require("user.lsp.servers.rust_analyzer")
