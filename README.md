# Wezterm Theme Loader for Neovim

A Neovim plugin that lets you seamlessly load [Wezterm](https://wezfurlong.org/wezterm/) themes directly into your Neovim colorscheme using [colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim).

## Features

- [x] Load Wezterm themes by name
- [x] Automatic theme data fetching from Wezterm repository
- [x] Integration with colorbuddy.nvim for color application
- [ ] Theme preview functionality
- [ ] Theme search and autocomplete
- [ ] Cache downloaded themes
- [ ] Live theme reloading
- [ ] Custom theme path support
- [ ] Theme export functionality

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "S1M0N38/wezterm-theme-loader.nvim",
  dependencies = {
    "tjdevries/colorbuddy.nvim",
  },
  config = function()
    require("wezterm-theme-loader").setup({
      -- Optional: default configuration
      name = "Catppuccin Mocha", -- Default theme name
      cache_path = vim.fn.stdpath("cache") .. "/wezterm-themes",
    })
  end,
}
```

## Usage

After installation, you can load themes using:

```lua
-- Load a specific theme
require("wezterm-theme-loader").load_theme("Catppuccin Mocha")

-- List available themes
:WeztermThemeList

-- Search and preview themes
:WeztermThemeSearch
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - see [LICENSE](LICENSE) for details
