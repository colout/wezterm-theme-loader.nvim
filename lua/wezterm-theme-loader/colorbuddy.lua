M = {}

M.apply = function(theme_colors)
  require("colorbuddy").colorscheme("wezterm")
  utils = require("wezterm-theme-loader.utils")

  -- If ANSI colors == bright colors, then we should create a new "bright" color that's just blended with
  -- white
  -- TODO: break this to its own file
  for i = 1, 8 do
    if theme_colors.ansi[i] == theme_colors.brights[i] then
      theme_colors.brights[i] = utils.shade("#ffffff", 0.3, theme_colors.ansi[i])
    end
  end

  local colorbuddy = require("colorbuddy")
  local Color = colorbuddy.Color
  local Group = colorbuddy.Group
  local c = colorbuddy.colors
  local g = colorbuddy.groups
  local s = colorbuddy.styles

  -- list all top level keys in c
  -- TODO: explicitly assign values for most of these if not all
  --for k, v in pairs(c) do
  --  print(k)
  --end

  -- ansi/bright colors
  Color.new("white", theme_colors.brights[8])
  Color.new("black", theme_colors.ansi[1])

  Color.new("softwhite", theme_colors.ansi[8])
  Color.new("light_black", theme_colors.brights[1])

  Color.new("red", theme_colors.ansi[2])
  Color.new("green", theme_colors.ansi[3])
  Color.new("yellow", theme_colors.ansi[4])
  Color.new("blue", theme_colors.ansi[5])
  Color.new("magenta", theme_colors.ansi[6])
  Color.new("cyan", theme_colors.ansi[7])

  Color.new("bright_red", theme_colors.brights[2])
  Color.new("bright_green", theme_colors.brights[3])
  Color.new("bright_yellow", theme_colors.brights[4])
  Color.new("bright_blue", theme_colors.brights[5])
  Color.new("bright_magenta", theme_colors.brights[6])
  Color.new("bright_cyan", theme_colors.brights[7])

  -- Blended darks
  Color.new("dark_red", utils.shade(theme_colors.background, 0.3, theme_colors.ansi[2]))
  Color.new("dark_green", utils.shade(theme_colors.background, 0.3, theme_colors.ansi[3]))
  Color.new("dark_yellow", utils.shade(theme_colors.background, 0.3, theme_colors.ansi[4]))
  Color.new("dark_blue", utils.shade(theme_colors.background, 0.3, theme_colors.ansi[5]))
  Color.new("dark_magenta", utils.shade(theme_colors.background, 0.3, theme_colors.ansi[6]))
  Color.new("dark_cyan", utils.shade(theme_colors.background, 0.3, theme_colors.ansi[7]))
  Color.new("dark_white", utils.shade(theme_colors.background, 0.3, theme_colors.ansi[8]))

  -- Blended greys
  Color.new("dark_grey", utils.shade(theme_colors.background, 0.5, theme_colors.foreground))
  Color.new("darker_grey", utils.shade(theme_colors.background, 0.75, theme_colors.foreground))

  -- backgrounds
  Color.new("background_lighter", utils.shade(theme_colors.background, 0.90, "#ffffff"))
  Color.new("background_light", utils.shade(theme_colors.background, 0.95, "#ffffff"))
  Color.new("background", theme_colors.background)
  Color.new("background_dark", utils.shade(theme_colors.background, 0.95))
  Color.new("background_darker", utils.shade(theme_colors.background, 0.90))
  Color.new("background_float", utils.shade(theme_colors.background, 0.85))
  Color.new("background_option", utils.shade(theme_colors.background, 0.80))
  Color.new("background_very_dark", utils.shade(theme_colors.background, 0.50))
  --Color.new("background_cursor", theme_colors.cursor_bg)

  -- Selection
  --Color.new("background_selection", theme_colors.selection_bg)
  --Color.new("foreground_selection", theme_colors.selection_fg) -- not defined in some themes.  should fallback

  -- foregrounds
  Color.new("foreground", theme_colors.foreground)
  --Color.new("foreground_cursor", theme_colors.cursor_fg)

  -- Override background to transparent
  -- Groups
  Group.new("Normal", c.white, c.none)
  Group.new("LineNr", c.darker_grey, c.background_dark)
  Group.new("CursorLineNr", c.yellow)
  Group.new("Special", c.dark_magenta)
  Group.new("Comment", c.dark_grey)
  Group.new("@constant", c.blue, nil, s.none)
  Group.new("@function", c.yellow, nil, s.none)
  Group.new("@function.bracket", g.Normal, g.Normal)
  Group.new("@keyword", c.blue, nil, s.none)
  Group.new("@keyword.faded", g.nontext.foreground, nil, s.none)
  Group.new("@prroperty", c.dark_yellow)
  Group.new("@variable", c.white, nil)
  Group.new("@variable.builtin", c.orange, g.Normal)
  Group.new("NormalFloat", c.foreground, c.background_float)
  Group.new("IblIndent", c.background_lighter)
  Group.new("MiniIndentscopeSymbol", c.dark_magenta)
  Group.new("Whitespace", c.darker_grey)
  Group.new("Keyword", c.bright_blue)
  Group.new("Type", c.bright_green)

  --  -- ["@include"] = {},
  --    -- ["@preproc"] = {},
  --    ["@debug"] = { fg = colors.purpleDark },
  --    ["@tag"] = { link = "Tag" },
  --    ["@tag.delimiter"] = { fg = colors.symbol },
  --    ["@tag.attribute"] = { fg = colors.purple },
  --    ["@attribute"] = { link = "Attribute" },
  --    ["@error"] = { link = "Error" },
  --    ["@warning"] = { link = "WarningMsg" },
  --    ["@info"] = { fg = colors.blue },
  --
  --    -- Specific languages
  --    -- overrides
  --    ["@label.json"] = { fg = colors.property }, -- For json
  --    ["@label.help"] = { link = "@texcolors.uri" }, -- For help files
  --    ["@texcolors.uri.html"] = { underline = true }, -- For html
  --
  --    -- semantic highlighting
  --    ["@lsp.type.namespace"] = { link = "@namespace" },
  --    ["@lsp.type.type"] = { link = "@type" },
  --    ["@lsp.type.class"] = { link = "@type" },
  --    ["@lsp.type.enum"] = { link = "@type" },
  --    ["@lsp.type.interface"] = { link = "@type" },
  --    ["@lsp.type.struct"] = { link = "@type" },
  --    ["@lsp.type.parameter"] = { link = "@parameter" },
  --    ["@lsp.type.property"] = { link = "@text" },
  --    ["@lsp.type.enumMember"] = { link = "@constant" },
  --    ["@lsp.type.function"] = { link = "@function" },
  --    ["@lsp.type.method"] = { link = "@method" },
  --    ["@lsp.type.macro"] = { link = "@label" },
  --    ["@lsp.type.decorator"] = { link = "@label" },
  --    ["@lsp.typemod.function.declaration"] = { link = "@function" },
  --    ["@lsp.typemod.function.readonly"] = { link = "@function" },
  --  }
  --
  --  -- Apply overrides
  --  if config.overrides then
  --    groups =
  --      vim.tbl_extend("force", groups, type(config.overrides) == "function" and config.overrides() or config.overrides)
  --  end
  --
  --  -- Set all highlight groups
  --  for group, parameters in pairs(groups) do
  --    vim.api.nvim_set_hl(0, group, parameters)
  --  end
  --end
  --
  --function M.apply_colors(colors)
  --  if not colors or type(colors) ~= "table" then
  --    vim.notify("Invalid colors table provided", vim.log.levels.ERROR)
  --    return
  --  end
  --
  --  -- Validate minimum required color structure
  --  if not colors.bg or not colors.fg then
  --    vim.notify("Colors must contain at least bg and fg values", vim.log.levels.ERROR)
  --    return
  --  end
  --
  --  set_terminal_colors(colors)
  --  set_groups(colors)
  --end
  --
  --return M
  --    Normalo = { fg = colors.fg, bg = bg },
  --    LineNr = { fg = colors.fgLineNr },
  --    ColorColumn = { bg = utils.shade(colors.blueLight, 0.5, colors.bg) },
  --    Conceal = {},
  --    Cursor = { fg = colors.bg, bg = colors.fg },
  --    lCursor = { link = "Cursor" },
  --    CursorIM = { link = "Cursor" },
  --    CursorLine = { bg = colors.bgDarker },
  --    CursorColumn = { link = "CursorLine" },
  --    Directory = { fg = colors.blue },
  --    DiffAdd = { bg = bg, fg = diff_add },
  --    DiffChange = { bg = bg, fg = diff_change },
  --    DiffDelete = { bg = bg, fg = diff_delete },
  --    DiffText = { bg = bg, fg = diff_text },
  --    EndOfBuffer = { fg = colors.purple },
  --    TermCursor = { link = "Cursor" },
  --    TermCursorNC = { link = "Cursor" },
  --    ErrorMsg = { fg = colors.red },
  --    VertSplit = { fg = colors.border, bg = bg },
  --    Winseparator = { link = "VertSplit" },
  --    SignColumn = { link = "Normal" },
  --    Folded = { fg = colors.fg, bg = colors.bgDarker },
  --    FoldColumn = { link = "SignColumn" },
  --    IncSearch = { bg = utils.mix(colors.blue, colors.bg, math.abs(0.30)), fg = colors.bg },
  --    Substitute = { link = "IncSearch" },
  --    CursorLineNr = { fg = colors.fg },
  --    MatchParen = { fg = colors.red, bg = bg },
  --    ModeMsg = { link = "Normal" },
  --    MsgArea = { link = "Normal" },
  --    -- MsgSeparator = {},
  --    MoreMsg = { fg = colors.blue },
  --    NonText = { fg = utils.shade(colors.bg, 0.30) },
  --    NormalFloat = { bg = colors.bgFloat },
  --    NormalNC = { link = "Normal" },
  --    Pmenu = { link = "NormalFloat" },
  --    PmenuSel = { bg = colors.bgOption },
  --    PmenuSbar = { bg = utils.shade(colors.blue, 0.5, colors.bg) },
  --    PmenuThumb = { bg = utils.shade(colors.bg, 0.20) },
  --    Question = { fg = colors.blue },
  --    QuickFixLine = { fg = colors.blue },
  --    SpecialKey = { fg = colors.symbol },
  --    StatusLine = { fg = colors.fg, bg = bg },
  --    StatusLineNC = { fg = colors.fgInactive, bg = colors.bgDark },
  --    TabLine = { bg = colors.bgDark, fg = colors.fgInactive },
  --    TabLineFill = { link = "TabLine" },
  --    TabLineSel = { bg = colors.bg, fg = colors.fgAlt },
  --    Search = { bg = utils.shade(colors.orangeLight, 0.40, colors.bg) },
  --    SpellBad = { undercurl = true, sp = colors.red },
  --    SpellCap = { undercurl = true, sp = colors.blue },
  --    SpellLocal = { undercurl = true, sp = colors.purple },
  --    SpellRare = { undercurl = true, sp = colors.orange },
  --    Title = { fg = colors.blue },
  --    Visual = { bg = utils.shade(colors.blue, 0.40, colors.bg) },
  --    VisualNOS = { link = "Visual" },
  --    WarningMsg = { fg = colors.orange },
  --    Whitespace = { fg = colors.symbol },
  --    WildMenu = { bg = colors.bgOption },
  --    Comment = { fg = colors.comment, italic = config.italics.comments or false },
  --
  --    Constant = { fg = colors.orangeLight },
  --    String = { fg = colors.orangeLight, italic = config.italics.strings or false },
  --    Character = { fg = colors.orangeLight },
  --    Number = { fg = colors.orangeLight, bold = true },
  --    Boolean = { fg = colors.orangeLight },
  --    Float = { link = "Number" },
  --
  --    Identifier = { fg = colors.fg },
  --    Function = { fg = colors.purple },
  --    Method = { fg = colors.blueLight },
  --    Property = { fg = colors.purpleDark },
  --    Field = { link = "Property" },
  --    Parameter = { fg = colors.fg },
  --    Statement = { fg = colors.blue },
  --    Conditional = { fg = colors.fg },
  --    -- Repeat = {},
  --    Label = { fg = colors.blue },
  --    Operator = { fg = colors.redDark },
  --    Keyword = { link = "Statement", italic = config.italics.keywords or false },
  --    Exception = { fg = colors.red },
  --
  --    PreProc = { link = "Keyword" },
  --    -- Include = {},
  --    Define = { fg = colors.purple },
  --    Macro = { link = "Define" },
  --    PreCondit = { fg = colors.red },
  --
  --    Type = { fg = colors.purple },
  --    Struct = { link = "Type" },
  --    Class = { link = "Type" },
  --
  --    -- StorageClass = {},
  --    -- Structure = {},
  --    -- Typedef = {},
  --
  --    Attribute = { link = "Character" },
  --    Punctuation = { fg = colors.symbol },
  --    Special = { fg = colors.symbol },
  --
  --    SpecialChar = { fg = colors.red },
  --    Tag = { fg = colors.orangeLight },
  --    Delimiter = { fg = colors.symbol },
  --    -- SpecialComment = {},
  --    Debug = { fg = colors.purpleDark },
  --
  --    Underlined = { underline = true },
  --    Bold = { bold = true },
  --    Italic = { italic = true },
  --    Ignore = { fg = colors.bg },
  --    Error = { link = "ErrorMsg" },
  --    Todo = { fg = colors.orange, bold = true },
  --
  --    DiagnosticError = { link = "Error" },
  --    DiagnosticWarn = { link = "WarningMsg" },
  --    DiagnosticInfo = { fg = colors.blue },
  --    DiagnosticHint = { fg = colors.yellowDark },
  --    DiagnosticVirtualTextError = { link = "DiagnosticError" },
  --    DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
  --    DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
  --    DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
  --    DiagnosticUnderlineError = { undercurl = true, link = "DiagnosticError" },
  --    DiagnosticUnderlineWarn = { undercurl = true, link = "DiagnosticWarn" },
  --    DiagnosticUnderlineInfo = { undercurl = true, link = "DiagnosticInfo" },
  --    DiagnosticUnderlineHint = { undercurl = true, link = "DiagnosticHint" },
  --
  --    -- Tree-Sitter groups are defined with an "@" symbol, which must be
  --    -- specially handled to be valid lua code, we do this via the special
  --    -- sym function. The following are all valid ways to call the sym function,
  --    -- for more details see https://www.lua.org/pil/5.html
  --    --
  --    -- sym("@text.literal")
  --    -- sym('@text.literal')
  --    -- sym"@text.literal"
  --    -- sym'@text.literal'
  --    --
  --    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109
  --
  --    ["@text"] = { fg = colors.fg },
  --    ["@texcolors.literal"] = { link = "Property" },
  --    -- ["@texcolors.reference"] = {},
  --    ["@texcolors.strong"] = { link = "Bold" },
  --    ["@texcolors.italic"] = { link = "Italic" },
  --    ["@texcolors.title"] = { link = "Keyword" },
  --    ["@texcolors.uri"] = { fg = colors.blue, sp = colors.blue, underline = true },
  --    ["@texcolors.underline"] = { link = "Underlined" },
  --    ["@symbol"] = { fg = colors.symbol },
  --    ["@texcolors.todo"] = { link = "Todo" },
  --    ["@comment"] = { link = "Comment" },
  --    ["@punctuation"] = { link = "Punctuation" },
  --    ["@punctuation.bracket"] = { fg = colors.blueDark },
  --    ["@punctuation.delimiter"] = { link = "Delimiter" },
  --    ["@punctuation.separator.keyvalue"] = { fg = colors.blueDark },
  --
  --    ["@texcolors.diff.add"] = { fg = colors.green },
  --    ["@texcolors.diff.delete"] = { fg = colors.redDark },
  --
  --    ["@constant"] = { link = "Constant" },
  --    ["@constancolors.builtin"] = { link = "Keyword" },
  --    -- ["@constancolors.macro"] = {},
  --    -- ["@define"] = {},
  --    -- ["@macro"] = {},
  --    ["@string"] = { link = "String" },
  --    ["@string.escape"] = { fg = utils.shade(colors.orangeLight, 0.45) },
  --    ["@string.special"] = { fg = utils.shade(colors.blue, 0.45) },
  --    -- ["@character"] = {},
  --    -- ["@character.special"] = {},
  --    ["@number"] = { link = "Number" },
  --    ["@boolean"] = { link = "Boolean" },
  --    -- ["@float"] = {},
  --    ["@function"] = { link = "Function", italic = config.italics.functions or false },
  --    ["@function.call"] = { link = "Function" },
  --    ["@function.builtin"] = { link = "Function" },
  --    -- ["@function.macro"] = {},
  --    ["@parameter"] = { link = "Parameter" },
  --    ["@method"] = { link = "Function" },
  --    ["@field"] = { link = "Property" },
  --    ["@property"] = { link = "Property" },
  --    ["@constructor"] = { fg = colors.blue },
  --    -- ["@conditional"] = {},
  --    -- ["@repeat"] = {},
  --    ["@label"] = { link = "Label" },
  --    ["@operator"] = { link = "Operator" },
  --    ["@exception"] = { link = "Exception" },
  --    ["@variable"] = { fg = colors.fg, italic = config.italics.variables or false },
  --    ["@variable.builtin"] = { fg = colors.fg, italic = config.italics.variables or false },
  --    ["@type"] = { link = "Type" },
  --    ["@type.definition"] = { fg = colors.fg },
  --    ["@type.builtin"] = { fg = colors.blue },
  --    ["@type.qualifier"] = { fg = colors.blue },
  --    ["@keyword"] = { link = "Keyword" },
  --    -- ["@storageclass"] = {},
  --    -- ["@structure"] = {},
  --    ["@namespace"] = { link = "Type" },
  --    ["@annotation"] = { link = "Label" },
  --
  --
end

return M
