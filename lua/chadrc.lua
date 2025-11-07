-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local highlights = require("highlights")
M.base46 = {
  theme = "github_dark_dimmed",
  transparency = false,
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.ui = {
  telescope = { style = "borderless" }, -- borderless / bordered
  cmp = {
    icons_left = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    -- for tailwind, css lsp etc
    format_colors = { lsp = true, icon = "󱓻" },
  },
  tabufline = {
    enabled = false,
    lazyload = false,
  },
}

return M
