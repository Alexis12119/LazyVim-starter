---@type LazySpec
-- NOTE: For Java Development

return {
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    config = function()
      require("java").setup()
      require("lspconfig").jdtls.setup({
        on_attach = require("lazyvim.util.lsp").on_attach,
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    enabled = false,
  },
}
