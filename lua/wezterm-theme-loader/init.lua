local M = {}

---Setup the wezterm-theme-loader plugin
---@param opts UserOptions: plugin options
M.setup = function(opts)
  -- Initial housekeeping stuff
  require("wezterm-theme-loader.config").setup(opts)
  require("wezterm-theme-loader.cmd").create_cmds()

  -- Auto fetch the file
  M.options = require("wezterm-theme-loader.config").options
  if M.options.auto_fetch_on_launch and not require("wezterm-theme-loader.fetch").check_output_path() then
    require("wezterm-theme-loader.fetch").download_themes()
  end

  if M.options.theme_name then
    require("wezterm-theme-loader.loader").apply_theme(M.options.theme_name)
  end
end

return M
