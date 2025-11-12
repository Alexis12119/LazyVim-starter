---@type LazySpec
-- NOTE: Easy .NET Development
return {
  "GustavEikaas/easy-dotnet.nvim",
  opts = {},
  config = function(_, opts)
    require("easy-dotnet").setup(opts)
  end,
}
