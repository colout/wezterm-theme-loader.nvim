local M = {}

---Setup the wezterm-theme-loader plugin
---@param opts UserOptions: plugin options
M.setup = function(opts)
  -- Initial housekeeping stuff
  require("wezterm-theme-loader.config").setup(opts)
  require("wezterm-theme-loader.cmd").create_cmds()

  -- Auto fetch the file
  if not require("wezterm-theme-loader.fetch").check_output_path() then
    require("wezterm-theme-loader.fetch").download_themes()
  end
end

return M
