# dolores.nvim

A Neovim colorscheme focused on simplicity and readability.

## Install

```lua
return {
  "pompos02/dolores.nvim",
}
```

## Usage

```lua
vim.o.background = "dark" -- or "light"
vim.cmd.colorscheme("dolores")
```

Available schemes:

- `dolores`: default palette, switches with `vim.o.background`
- `dolores-kyriazis`: Tomorrow palette, switches with `vim.o.background`
- `dolores-kif`: dark-only green palette
- `dolores-thalasses`: One Dark palette, switches with `vim.o.background`
- `dolores-stratos`: Monokai palette
- `dolores-mitropanos`: Dolores-inspired palette, switches with `vim.o.background`
- `dolores-thes`: high-contrast palette, switches with `vim.o.background`
- `dolores-sotiria-bellou`: Gruvbox palette, switches with `vim.o.background`
- `dolores-glykeria`: Gruvbox palette, switches with `vim.o.background`
- `dolores-drapetis`: dark-only high-contrast palette
- `dolores-edelvais`: Vesper-inspired palette, switches with `vim.o.background`

## Omarchy builder

Build Omarchy themes and matching wallpapers from these palettes. See
[scripts/README.md](scripts/README.md) for instructions.

## Options

Configure Dolores before setting the colorscheme. All defaults are shown below.

```lua
require("dolores").setup({
  dim_inactive_windows = false,
  extend_background_behind_borders = true,

  enable = {
    legacy_highlights = true,
    migrations = true,
    terminal = true,
  },

  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },

  palette = {},

  groups = {
    border = "c5",
    link = "c16",
    panel = "c3",

    error = "c11",
    hint = "c12",
    info = "c14",
    ok = "c10",
    warn = "c8",
    note = "c12",
    todo = "c11",

    git_add = "c10",
    git_change = "c8",
    git_delete = "c11",
    git_dirty = "c8",
    git_ignore = "c5",
    git_merge = "c16",
    git_rename = "c12",
    git_stage = "c16",
    git_text = "c11",
    git_untracked = "c6",

    h1 = "c10",
    h2 = "c7",
    h3 = "c12",
    h4 = "c14",
    h5 = "c11",
    h6 = "c9",
  },

  highlight_groups = {},
  before_highlight = function(group, highlight, palette) end,
})

vim.cmd.colorscheme("dolores")
```

Colors accept palette keys (`bg`, `text`, `operator`, `visual`, and `c1` through `c18`), hex values, named colors, or `NONE`. Highlight overrides are merged by default; use `inherit = false` to replace a group.

When `enable.migrations` is `true`, these deprecated options are also recognized: `bold_vert_split`, `disable_background`, `disable_float_background`, `dim_nc_background`, `disable_bold`, `disable_bolds`, `disable_italic`, `disable_italics`, `groups.background`, `groups.comment`, `groups.punctuation`, and `groups.headings`. Prefer the current options shown above.
