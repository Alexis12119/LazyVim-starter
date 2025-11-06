-- since this is just an example spec, don't actually load anything here and return an empty spec
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
-- stylua: ignore
return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- we still use tokyonight as the base scheme, but override heavily to match github_dark_dimmed
      colorscheme = "tokyonight-night",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    on_highlights = function(hl, _)
      hl.DiffviewDiffDelete = { bg = "#422b2b", fg ="#422b2b"}
    end,
    },
  },
}
