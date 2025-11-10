-- NOTE: Commands
local command = vim.api.nvim_create_user_command

command("LuaSnipEdit", function()
  require("luasnip.loaders").edit_snippet_files()
end, { desc = "Edit the available snippets in the filetype" })

command("RemoveTrailingSpaces", function()
  vim.cmd(":%s/s+$//e")
end, { desc = "Remove all trailing spaces" })

command("AppendToEnd", function(args)
  local prefix = args.line1 .. "," .. args.line2
  local chars = args.fargs[1] ~= nil and args.fargs[1] or ";"
  vim.cmd(prefix .. "g/./normal A" .. chars)
  vim.cmd("nohlsearch")
end, { nargs = "?", desc = 'Append char(s) to end of each line (Default: ";")', range = true })

command("JoinEmptyLines", function(args)
  -- We need silent! because if no match pattern, it will notify error
  if args.fargs[1] ~= nil then
    vim.cmd("silent! g/^$/,/./-" .. args.fargs[1] .. "j") -- Max "n" empty line(s)
  elseif args.bang then
    vim.cmd("silent! g/^$/-j") -- No empty line
  else
    vim.cmd("silent! g/^$/,/./-1j") -- Join max 1 empty line
  end
  vim.cmd([[%s/\_s*\%$//e]]) -- remove the last empty lines
  vim.cmd("nohlsearch")
end, { desc = "Join empty lines", bang = true, nargs = "?" })

command("DiscordRichPresence", function()
  vim.g.disable_discord_rich_presence = not vim.g.disable_discord_rich_presence

  if not vim.g.disable_discord_rich_presence then
    vim.notify("Discord Rich Presence: Enabled", vim.log.levels.INFO, { title = "cord.nvim" })
    vim.cmd("Cord enable")
  else
    vim.notify("Discord Rich Presence: Disabled", vim.log.levels.INFO, { title = "cord.nvim" })
    vim.cmd("Cord disable")
  end
end, { desc = "Toggle Discord Rich Presence" })
command("EslintRun", function()
  require("core.utils").lint_project()
end, { desc = "Run ESLint (npm run lint)" })
