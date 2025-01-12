M = {}

M.create_cmds = function()
  -- Create separate commands for clarity
  vim.api.nvim_create_user_command("WeztermThemeLoad", function(opts)
    if opts.args == "" then
      vim.notify("Theme name required", vim.log.levels.ERROR)
      return
    end
    require("wezterm-theme-loader.loader").apply_theme(opts.args)
  end, {
    nargs = "+",
    desc = "Load a WezTerm theme",
  })

  vim.api.nvim_create_user_command("WeztermThemeFetch", function()
    require("wezterm-theme-loader.fetch").download_themes()
  end, {
    nargs = 0,
    desc = "Fetch WezTerm themes",
  })
end

return M
