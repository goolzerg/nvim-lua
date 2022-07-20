require("nvim-lsp-installer").setup {
  automatic_installation = true
}

local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

lspconfig.terraformls.setup {
}

lspconfig.yamlls.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}

