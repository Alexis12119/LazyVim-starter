-- NOTE: Global Variables
local sysname = vim.uv.os_uname().sysname
local os = sysname:match("Windows") and "Windows" or sysname:match("Linux") and "Linux" or sysname -- Windows, Linux, Darwin, NetBSD,...
local is_windows = os == "Windows"

local global = {
  snipmate_snippets_path = vim.fn.stdpath("config") .. "/snippets/snipmate", -- path to snipmate snippets
  skip_ts_context_commentstring_module = true, -- disable treesitter context commentstring
  ["loaded_node_provider"] = 0, -- disable node provider
  ["loaded_python3_provider"] = 0, -- disable python3 provider
  ["loaded_perl_provider"] = 0, -- disable perl provider
  ["loaded_ruby_provider"] = 0, -- disable ruby provider
  toggle_theme_icon = "   ",
  os = os,
  is_windows = is_windows,
  path_delimiter = is_windows and ";" or ":",
  path_separator = is_windows and "\\" or "/",
  ai_cmp = false,
}

for name, value in pairs(global) do
  vim.g[name] = value
end
