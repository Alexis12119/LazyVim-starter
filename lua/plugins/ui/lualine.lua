---@type LazySpec
-- NOTE: Statusline

local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch("([^/]+)") do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

local python_venv = function()
  if vim.bo.filetype ~= "python" then
    return " "
  end

  local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV") or " "
  if venv == " " then
    return " "
  else
    return "  " .. venv
  end
end
local clients = function()
  local clients = {}
  local buf = vim.api.nvim_get_current_buf()

  -- Iterate through all the clients for the current buffer
  for _, client in pairs(vim.lsp.get_clients({ bufnr = buf })) do
    -- Add the client name to the `clients` table
    table.insert(clients, client.name)
  end

  local lint_ok, lint = pcall(require, "lint")
  if lint_ok then
    local linters = {}
    local fts = vim.split(vim.bo.filetype, ".", { plain = true, trimempty = true })
    for _, ft in pairs(fts) do
      vim.list_extend(linters, lint.linters_by_ft[ft] or {})
    end
    if #linters ~= 0 then
      table.insert(clients, table.concat(linters, ", "))
    end
  end

  local conform_ok, conform = pcall(require, "conform")
  if conform_ok then
    local formatters = conform.list_formatters(0)
    for _, formatter in pairs(formatters) do
      -- Check if the formatter is already in the clients table
      if not vim.tbl_contains(clients, formatter.name) then
        table.insert(clients, formatter.name)
      end
    end
  end

  if #clients == 0 then
    return ""
  else
    return (vim.o.columns > 100 and (" %#St_gitIcons#" .. table.concat(clients, ", ") .. " ")) or "  LSP "
  end
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, { clients })
      table.insert(opts.sections.lualine_x, {
        function()
          local venv = python_venv()
          return venv ~= " " and venv or ""
        end,
      })
      opts.always_show_tabline = false
    end,
  },
}
