---@type LazySpec
-- NOTE: Statusline
local utils = require("config.utils")
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, { utils.python_venv })
      opts.always_show_tabline = false
    end,
  },
}
