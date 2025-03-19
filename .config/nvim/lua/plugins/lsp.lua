local lspconfig = require("lspconfig")

--local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pyright.setup {
  capabilities = lsp_capabilities,
}

lspconfig.rust_analyzer.setup {
  capabilities = lsp_capabilities,
}

lspconfig.ccls.setup {
  capabilities = lsp_capabilities,
}

lspconfig.ltex.setup {
  filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
  capabilities = lsp_capabilities,
}

lspconfig.texlab.setup {
  capabilities = lsp_capabilities,
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
  capabilities = lsp_capabilities,
}

lspconfig.nil_ls.setup {
  capabilities = lsp_capabilities,
}
