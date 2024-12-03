local M = {}

---Setup the wezterm-theme-loader plugin
---@param opts UserOptions: plugin options
M.setup = function(opts)
  require("wezterm-theme-loader.config").setup(opts)
  require("wezterm-theme-loader.cmd").create_cmds()

  if M.options.auto_fetch_on_launch and not require("wezterm-theme-loader.fetch").check_output_path() then
    require("wezterm-theme-loader.fetch").download_themes()
  end
end

return M
