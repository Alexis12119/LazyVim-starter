---@type LazySpec
-- NOTE: Modern Undotree
return {
  "XXiaoA/atone.nvim",
  cmd = "Atone",
  opts = {}, -- your configuration here
  init = function()
    vim.keymap.set("n", "<leader>bu", ":Atone<CR>", { desc = "Undo Tree" })
  end,
}
