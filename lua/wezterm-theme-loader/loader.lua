local utils = require("wezterm-theme-loader.utils")
local M = {}

-- Load colorschemes from JSON file
function M.load_colorschemes()
  local json_path = require("wezterm-theme-loader.config").options.theme_file_path

  -- Check if file exists
  local stat = vim.loop.fs_stat(json_path)
  if not stat then
    vim.notify("Themes file does not exist.  Please run the fetch command: " .. json_path, vim.log.levels.INFO)
    return nil
  end

  -- Check file size
  if stat.size == 0 then
    vim.notify("Themes file is empty.  Please try fetching again: " .. json_path, vim.log.levels.ERROR)
    return nil
  end

  -- Try to open file
  local file = io.open(json_path, "r")
  if not file then
    vim.notify("Could not open themes file: " .. json_path, vim.log.levels.ERROR)
    return nil
  end

  local content = file:read("*all")
  file:close()

  print("Loading themes from: " .. json_path)
  local ok, decoded = pcall(vim.json.decode, content)
  if not ok then
    vim.notify("Failed to parse colorschemes.json: " .. decoded, vim.log.levels.ERROR)
    return nil
  end

  return decoded
end

-- Find theme by name or alias
function M.find_theme(theme_name)
  if not theme_name or type(theme_name) ~= "string" or theme_name == "" then
    vim.notify("Invalid theme name", vim.log.levels.ERROR)
    return nil
  end

  local schemes = M.load_colorschemes()
  if not schemes then
    return nil
  end

  for _, theme in ipairs(schemes) do
    -- Check exact name match
    if theme.metadata.name == theme_name then
      return theme
    end
  end

  return nil
end

function M.apply_theme(theme_name)
  local colors = M.find_theme(theme_name)
  if not colors then
    vim.notify("Could not find theme: " .. theme_name, vim.log.levels.ERROR)
    return
  end

  --local palette_colors = require("wezterm-theme-loader.palette").convert_ansi_to_palette(colors.colors)
  require("wezterm-theme-loader.colorbuddy").apply(colors.colors)
end

return M
