-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").biome.setup({})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "en.json", "es.json" },
  callback = function()
    vim.b.autoformat = false
  end,
})
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
  capabilities = capabilities,
})
