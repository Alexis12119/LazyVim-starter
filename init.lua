vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("config.filetypes")
require("config.utils")
