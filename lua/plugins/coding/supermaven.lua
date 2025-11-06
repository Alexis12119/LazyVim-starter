---@type LazySpec
-- NOTE: AI Autocomplete

return {
  "supermaven-inc/supermaven-nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  opts = {
    disable_keymaps = false,
    disable_inline_completion = false,
    keymaps = {
      accept_suggestion = "<A-f>",
      clear_suggestion = "<Nop>",
      accept_word = "<A-w>",
    },
  },
}
