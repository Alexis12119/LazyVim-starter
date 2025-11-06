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

local function python_venv()
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

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, { python_venv })
      opts.always_show_tabline = false
    end,
  },
}
