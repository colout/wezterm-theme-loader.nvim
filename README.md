# Wezterm Theme Loader for Neovim

A Neovim plugin that lets you seamlessly load [Wezterm](https://wezfurlong.org/wezterm/) themes directly into your Neovim colorscheme using [colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim).

## Features

- [ ] Load Wezterm themes by name
- [ ] Automatic theme data fetching from Wezterm repository
- [x] Integration with colorbuddy.nvim for color application
- [ ] Command to list themes
- [ ] Search themes in telescope (optional)

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "colout/wezterm-theme-loader.nvim",
  dependencies = {
    "tjdevries/colorbuddy.nvim",
  },
  end,
}
```

## Usage

After installation, you can load themes using:

```lua
-- Load a specific theme
:WeztermThemeLoad <theme_name>

-- Fetch themes from wezterm git repo
:WeztermThemeFetch
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - see [LICENSE](LICENSE) for details
