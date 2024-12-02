local sub_cmds = {
  fetch = { fn = require("wezterm-theme-loader.fetch").download_themes, nargs = 0 },
  load = { fn = require("wezterm-theme-loader.loader").find_theme, nargs = 1 },
}

local sub_cmds_keys = {}
for k, _ in pairs(sub_cmds) do
  table.insert(sub_cmds_keys, k)
end

local function main_cmd(opts)
  local args = vim.split(opts.args, " ", { trimempty = true })
  local cmd = args[1]
  local sub_cmd = sub_cmds[cmd]

  if sub_cmd == nil then
    vim.notify("wezterm-theme-loader: invalid subcommand", vim.log.levels.ERROR)
    return
  end

  if #args - 1 ~= sub_cmd.nargs then
    vim.notify(string.format("wezterm-theme-loader: command '%s' expects %d argument(s)", cmd, sub_cmd.nargs), vim.log.levels.ERROR)
    return
  end

  sub_cmd.fn(select(2, unpack(args)))
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
