---@class Config
local M = {}

---@class DefaultOptions
M.defaults = {
  theme_file_path = vim.fn.stdpath("data") .. "/wezterm-themes.json", -- Where the theme file is fetched to
}

---@class Options
M.options = {}

---Extend the defaults options table with the user options
---@param opts UserOptions: plugin options
M.setup = function(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

return M
