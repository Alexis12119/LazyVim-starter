---@type LazySpec
-- NOTE: Tmux navigation

return {
  "alexghergh/nvim-tmux-navigation",
  enabled = vim.fn.executable("tmux") == 1,
  event = "VeryLazy",
  opts = {
    keybindings = {
      left = "<C-h>",
      down = "<C-j>",
      up = "<C-k>",
      right = "<C-l>",
      last_active = "<C-\\>",
      next = "<C-Space>",
    },
  },
}
