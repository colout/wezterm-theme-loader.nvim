local sub_cmds = {
  fetch = require("wezterm-theme-loader.fetch").download_themes,
  load = require("wezterm-theme-loader.loader").find_theme,
}

local sub_cmds_keys = {}
for k, _ in pairs(sub_cmds) do
  table.insert(sub_cmds_keys, k)
end

local function main_cmd(opts)
  -- opt.args is a string with the sub-arguments (space delimited, as inputted)
  local sub_cmd = sub_cmds[opts.args]
  if sub_cmd == nil then
    vim.print("wezterm-theme-loader: invalid subcommand")
  else
    sub_cmd()
  end
end

vim.api.nvim_create_user_command("WeztermThemeLoader", main_cmd, {
  nargs = "?",
  desc = "wezterm-theme-loader example command",
  complete = function(arg_lead, _, _)
    return vim
      .iter(sub_cmds_keys)
      :filter(function(sub_cmd)
        return sub_cmd:find(arg_lead) ~= nil
      end)
      :totable()
  end,
})
