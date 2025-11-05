return {
  {
    "nvchad/base46",
    enabled = false,
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/ui",
    enabled = false,
    lazy = true,
    config = function()
      require("nvchad")
    end,
  },
  {
    enabled = false,
    "nvchad/volt", -- needed for theme switcher
  },
}
