-- NOTE: Global Variables

local sysname = vim.uv.os_uname().sysname
local os = sysname:match("Windows") and "Windows" or sysname:match("Linux") and "Linux" or sysname -- Windows, Linux, Darwin, NetBSD, etc.
local is_windows = os == "Windows"

vim.g.skip_ts_context_commentstring_module = true -- disable treesitter context commentstring
vim.g.loaded_node_provider = 0 -- disable node provider
vim.g.loaded_python3_provider = 0 -- disable python3 provider
vim.g.loaded_perl_provider = 0 -- disable perl provider
vim.g.loaded_ruby_provider = 0 -- disable ruby provider
vim.g.toggle_theme_icon = "   "
vim.g.os = os
vim.g.is_windows = is_windows
vim.g.path_delimiter = is_windows and ";" or ":"
vim.g.path_separator = is_windows and "\\" or "/"
vim.g.ai_cmp = false
