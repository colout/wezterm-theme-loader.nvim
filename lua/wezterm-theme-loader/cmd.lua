local sub_cmds = {
  fetch = { fn = require("wezterm-theme-loader.fetch").download_themes },
  load = { fn = require("wezterm-theme-loader.loader").apply_theme },
}

local sub_cmds_keys = {}
for k, _ in pairs(sub_cmds) do
  table.insert(sub_cmds_keys, k)
end

local function main_cmd(opts)
  local args = vim.split(opts.args, "%s+", { trimempty = true })
  local cmd = args[1]
  local sub_cmd = sub_cmds[cmd]

  if sub_cmd == nil then
    vim.notify("wezterm-theme-loader: invalid subcommand", vim.log.levels.ERROR)
    return
  end

  if cmd == "fetch" then
    sub_cmd.fn()
  elseif cmd == "load" then
    -- Everything after the first word is the theme name
    local theme_name = opts.args:match("^%s*load%s+(.+)$")
    if not theme_name then
      vim.notify("wezterm-theme-loader: load command requires a theme name", vim.log.levels.ERROR)
      return
    end
    sub_cmd.fn(theme_name)
  end
end

vim.api.nvim_create_user_command("WeztermThemeLoader", main_cmd, {
  nargs = "+",
  desc = "wezterm-theme-loader commands",
  complete = function(arg_lead, _, _)
    return vim
      .iter(sub_cmds_keys)
      :filter(function(sub_cmd)
        return sub_cmd:find(arg_lead) ~= nil
      end)
      :totable()
  end,
})
