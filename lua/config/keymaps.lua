-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local utils = require("config.utils")

-- Yank All Text
vim.keymap.set("n", "<leader>y", "<cmd>%y+<cr>", { desc = "Yank All Text", silent = true })

-- Delete All Text
vim.keymap.set("n", "<leader>bR", "<cmd>%d+<cr>", { desc = "Remove All Text", silent = true })

-- Save With Root
vim.keymap.set("n", "<leader>bs", "<cmd>SudaWrite<cr>", { desc = "Save With Root", silent = true })

-- Go to previous tab
vim.keymap.set("n", "<Left>", "<cmd>tabprevious<CR>", { desc = "General | Go to previous tab", silent = true })

-- Go to next tab
vim.keymap.set("n", "<Right>", "<cmd>tabnext<CR>", { desc = "General | Go to next tab", silent = true })

-- New tab
vim.keymap.set("n", "<Up>", "<cmd>tabnew<CR>", { desc = "General | New tab", silent = true })

-- Close tab
vim.keymap.set("n", "<Down>", "<cmd>tabclose<CR>", { desc = "General | Close tab", silent = true })

-- Run Code
vim.keymap.set("n", "<leader>ce", function()
  utils.run_code()
end, { desc = "Execute Code", silent = true })

-- Project Bootstrap
vim.keymap.set("n", "<leader>P", function()
  utils.bootstrap_project()
end, { desc = "Project Bootstrap", silent = true })

-- lazy
vim.keymap.set("n", "<leader>le", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy Home" })

-- From: https://medium.com/@musickcorym/fixing-the-lag-why-i-ditched-vim-tmux-navigator-for-a-faster-plugin-free-setup-239da138e4aa
local function smart_move(direction, tmux_cmd)
  local curwin = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. direction)
  if curwin == vim.api.nvim_get_current_win() then
    vim.fn.system("tmux select-pane " .. tmux_cmd)
  end
end

vim.keymap.set("n", "<C-h>", function()
  smart_move("h", "-L")
end, { silent = true })
vim.keymap.set("n", "<C-j>", function()
  smart_move("j", "-D")
end, { silent = true })
vim.keymap.set("n", "<C-k>", function()
  smart_move("k", "-U")
end, { silent = true })
vim.keymap.set("n", "<C-l>", function()
  smart_move("l", "-R")
end, { silent = true })
