local wezterm_theme_loader = require("wezterm-theme-loader")

-- Test wezterm-theme-loader.nvim with default options
describe("Default options", function()
  wezterm_theme_loader.setup({})
  it("can say hello", function()
    assert.are.equal("Hello John Doe", wezterm_theme_loader.hello())
  end)
  it("can say bye", function()
    assert.are.equal("Bye John Doe", wezterm_theme_loader.bye())
  end)
end)

-- Test wezterm-theme-loader.nvim with user defined options
describe("User defined options", function()
  wezterm_theme_loader.setup({ name = "John Smith" })
  it("can say hello", function()
    assert.are.equal("Hello John Smith", wezterm_theme_loader.hello())
  end)
  it("can say bye", function()
    assert.are.equal("Bye John Smith", wezterm_theme_loader.bye())
  end)
end)

-- RESOURCES:
--   - https://github.com/lunarmodules/busted
--   - https://hiphish.github.io/blog/2024/01/29/testing-neovim-plugins-with-busted/
