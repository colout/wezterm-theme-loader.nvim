local M = {}

local WEZTERM_THEMES_URL = "https://raw.githubusercontent.com/wez/wezterm/refs/heads/main/docs/colorschemes/data.json"

function M.check_output_path()
  local output_path = require("wezterm-theme-loader.config").options.theme_file_path

  if vim.fn.filereadable(output_path) == 1 then
    return true, output_path
  end
  return false
end

function M.download_themes()
  -- Default to a standard location if no path provided
  local output_path = require("wezterm-theme-loader.config").options.theme_file_path

  if M.check_output_path() then
    vim.notify("Wezterm themes already downloaded to " .. output_path, vim.log.levels.INFO)
    return true, output_path
  end

  if output_path == nil then
    vim.notify("Please set opts.theme_file_path.  No file downloaded.", vim.log.levels.ERROR)
    return false
  end

  -- Use vim.fn.system to download the file
  local cmd = string.format("curl -L -o %q %q", output_path, WEZTERM_THEMES_URL)
  local result = vim.fn.system(cmd)

  -- Check for errors
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to download Wezterm themes: " .. result, vim.log.levels.ERROR)
    return false
  end

  vim.notify("Successfully downloaded Wezterm themes to " .. output_path, vim.log.levels.INFO)
  return true, output_path
end
return M
