# Omarchy builder

Generate local Omarchy themes, matching Neovim configurations, and soft-glow
wallpapers from the Dolores palettes.

## Requirements

- Omarchy with its standard Neovim integration.
- Neovim with support for `nvim -l`.
- Python 3.11+ and ImageMagick (`magick`) for wallpaper generation.

Run all commands below from the repository root.

## Build and use

```bash
nvim -l scripts/generate-omarchy.lua
python scripts/generate-wallpaper.py --all
omarchy theme switcher --preload
```

This creates all 20 palette variants and matching 4K wallpapers without changing
the active desktop. Select a theme in Omarchy's picker, or run:

```bash
omarchy theme set dolores-edelvais-dark
```

Neovim uses the actual colorscheme from this checkout, not a generated substitute.
Keep this checkout in place, or regenerate after moving it. Omarchy's standard
integration links `~/.config/nvim/lua/plugins/theme.lua` to the current theme's
`neovim.lua`. Restart Neovim if an existing session does not pick up a switch.

## Wallpapers

Generate a variation for one theme:

```bash
python scripts/generate-wallpaper.py --theme dolores-edelvais-dark \
  --seed 7 --size 2560x1440
```

Seed `0` is the default soft-glow composition; other seeds move the glows.
A family's light/dark variants share the same layout. Colors are blended from
each theme's background, accent, and green.

Images live in `~/.config/omarchy/backgrounds/<theme>/`, so they survive theme
regeneration. A theme-local `preview.png` link makes them visible in the visual
theme selector. Existing images and previews are not overwritten; choose another
seed or output directory for new variations.

Use `omarchy theme bg next` to cycle the active theme's backgrounds.
Use `--output DIR` to generate wallpapers elsewhere without installing previews,
or `--themes-dir DIR` to read palettes from another theme directory.

To reuse an existing wallpaper instead of generating glows, pass it when first
building themes:

```bash
nvim -l scripts/generate-omarchy.lua \
  --wallpaper "$(readlink -f ~/.local/state/omarchy/current/background)"
```

The image is copied into a shared, hidden file under the themes directory and
linked from each theme. Omit `--wallpaper` on later builds to reuse that snapshot.

## Regenerate themes

After editing `lua/dolores/palettes.lua`:

```bash
nvim -l scripts/generate-omarchy.lua --force
omarchy theme switcher --preload
```

Existing theme directories are refused unless `--force` is passed. Replaced
directories are backed up to the sibling `themes-backups` directory; custom
per-theme files are backed up, not merged. Existing glow wallpapers are reused
for previews. To render updated colors, generate wallpapers with a new seed or
output directory.

Use `--output DIR` to build themes elsewhere.

Desktop colors use semantic mappings, such as errors for red and functions for
the accent. Limited-color palettes reuse colors rather than inventing a full
rainbow. Kif's `light` variant remains visually dark, just as in Neovim.

## Checks

```bash
nvim -u NONE -l scripts/test-omarchy.lua
```
