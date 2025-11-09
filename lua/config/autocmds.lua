-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- NOTE: Autocommands

local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General", { clear = true })

autocmd("TermOpen", {
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd("startinsert!")
  end,
  group = general,
  desc = "Terminal Options",
})

autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Disable comment on new line
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = general,
  desc = "Disable New Line Comment",
})

-- :h W10
autocmd("FileChangedRO", {
  callback = function()
    vim.bo.readonly = false
  end,
  group = general,
  desc = "Disable Readonly Message",
})

autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
  -- nested = true, -- for format on save
  callback = function()
    if vim.bo.filetype ~= "" and vim.bo.buftype == "" and vim.bo.modified then
      vim.cmd("silent! w")
    end
  end,
  group = general,
  desc = "Auto Save",
})

autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("File reloaded automatically", vim.log.levels.INFO, { title = "nvim" })
  end,
  group = general,
  desc = "Notify when file is reloaded",
})

autocmd("VimResized", {
  callback = function()
    vim.cmd("wincmd =")
  end,
  group = general,
  desc = "Equalize Splits",
})

-- autocmd("ModeChanged", {
--   callback = function()
--     if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
--       vim.opt.hlsearch = true
--     else
--       vim.opt.hlsearch = false
--     end
--   end,
--   group = general,
--   desc = "Highlighting matched words when searching",
-- })

autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    local mode = vim.fn.mode()
    if mode:match("i") then
      vim.opt.hlsearch = false -- hide in insert mode
    else
      vim.opt.hlsearch = true -- show in normal / visual / command modes
    end
  end,
  group = general,
  desc = "Show search highlights in normal mode, hide in insert mode",
})

autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "log" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group = general,
  desc = "Enable Wrap in these filetypes",
})

local overseer = augroup("Overseer", { clear = true })

autocmd("FileType", {
  pattern = "OverseerList",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd("startinsert!")
  end,
  group = overseer,
  desc = "Enter Normal Mode In OverseerList",
})

-- Timer-based file reload for TUI
local file_check_timer = nil
local last_check = {}

autocmd("VimEnter", {
  callback = function()
    file_check_timer = fn.timer_start(5000, function()
      local bufnr = vim.api.nvim_get_current_buf()
      local fname = vim.api.nvim_buf_get_name(bufnr)
      if fname == "" then
        return
      end

      local current_time = fn.getftime(fname)
      if current_time == -1 then
        return
      end

      if last_check[bufnr] and current_time > last_check[bufnr] then
        vim.cmd("checktime")
      end

      last_check[bufnr] = current_time
    end, { ["repeat"] = -1 })
  end,
  group = general,
  desc = "Start timer for file reload",
})

autocmd("VimLeave", {
  callback = function()
    if file_check_timer then
      fn.timer_stop(file_check_timer)
    end
  end,
  group = general,
  desc = "Stop timer on exit",
})

autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client == nil then
      return
    end
    client.server_capabilities.semanticTokensProvider = nil
    require("workspace-diagnostics").populate_workspace_diagnostics(client, vim.api.nvim_get_current_buf())
  end,
})
