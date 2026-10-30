#!/usr/bin/env python3
"""Generate soft-glow wallpapers from local Omarchy palettes using ImageMagick."""

import argparse
import os
from pathlib import Path
import random
import re
import shutil
import subprocess
import tempfile
import tomllib


def mix(base, accent, amount):
    return "#" + "".join(
        f"{round(int(base[i:i + 2], 16) * (1 - amount) + int(accent[i:i + 2], 16) * amount):02x}"
        for i in (1, 3, 5)
    )


def glow_points(palette, seed):
    """Work at a fixed 960x540 so composition is independent of output size."""
    bg = palette["background"]
    for key in ("background", "accent", "green"):
        if not re.fullmatch(r"#[0-9a-fA-F]{6}", palette[key]):
            raise ValueError(f"Invalid color for {key}: {palette[key]}")
    rng = random.Random(seed)
    x1, y1, x2, y2 = 250, 130, 740, 400
    if seed:
        x1 += rng.randint(-100, 100)
        y1 += rng.randint(-60, 60)
        x2 += rng.randint(-100, 100)
        y2 += rng.randint(-60, 60)
    return (
        f"0,0 {bg} {x1},{y1} {mix(bg, palette['accent'], .45)} "
        f"{x2},{y2} {mix(bg, palette['green'], .35)} "
        f"960,0 {bg} 0,540 {bg} 480,300 {bg} 960,540 {bg}"
    )


def render(palette, destination, size, seed):
    points = glow_points(palette, seed)
    destination.parent.mkdir(parents=True, exist_ok=True)
    # Render beside the destination, then publish without replacing an existing file.
    fd, temporary = tempfile.mkstemp(prefix=".glow-", suffix=".png", dir=destination.parent)
    os.close(fd)
    try:
        subprocess.run(
            [
                "magick", "-limit", "thread", "2", "-size", "960x540",
                "xc:" + palette["background"], "-define", "shepards:power=2",
                "-sparse-color", "Shepards", points, "-blur", "0x12",
                "-resize", size + "!", "-depth", "8", temporary,
            ],
            check=True,
        )
        os.link(temporary, destination)
    finally:
        Path(temporary).unlink(missing_ok=True)


def main():
    config = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config"))
    parser = argparse.ArgumentParser(description=__doc__)
    selection = parser.add_mutually_exclusive_group(required=True)
    selection.add_argument("--theme", help="Installed theme slug, e.g. dolores-edelvais-dark")
    selection.add_argument("--all", action="store_true", help="All installed Dolores themes")
    parser.add_argument("--size", default="3840x2160", help="WIDTHxHEIGHT (default: 3840x2160)")
    parser.add_argument("--seed", type=int, default=0, help="0 matches the original sample; other integers vary positions")
    parser.add_argument("--themes-dir", type=Path, default=config / "omarchy/themes")
    parser.add_argument("--output", type=Path, default=config / "omarchy/backgrounds", help="Root directory; images go into per-theme subdirectories")
    args = parser.parse_args()
    if not shutil.which("magick"):
        parser.error("ImageMagick (magick) is required")
    dimensions = re.fullmatch(r"([1-9]\d*)x([1-9]\d*)", args.size)
    if not dimensions or max(map(int, dimensions.groups())) > 16384:
        parser.error("--size must be WIDTHxHEIGHT, with each dimension between 1 and 16384")
    if args.theme and not re.fullmatch(r"[a-z0-9][a-z0-9-]*", args.theme):
        parser.error("--theme must be a theme slug, not a path")
    themes = (
        [args.themes_dir / args.theme] if args.theme
        else sorted(p for p in args.themes_dir.glob("dolores-*") if p.is_dir())
    )
    if not themes:
        parser.error("No Dolores themes found; run generate-omarchy.lua first")
    jobs = []
    for theme in themes:
        with (theme / "colors.toml").open("rb") as file:
            palette = tomllib.load(file)
        destination = args.output / theme.name / f"00-glow-{args.seed}-{args.size}.png"
        if os.path.lexists(destination):
            parser.error(f"Already exists: {destination}; choose another --seed or --output")
        glow_points(palette, args.seed)
        jobs.append((theme, palette, destination))
    for theme, palette, destination in jobs:
        render(palette, destination, args.size, args.seed)
        # The theme selector does not search the separate user backgrounds tree.
        # Publish a preview only for normal installations, not --output previews.
        preview = theme / "preview.png"
        if args.output.resolve() == (config / "omarchy/backgrounds").resolve() and not os.path.lexists(preview):
            preview.symlink_to(destination.resolve())
        print(destination)
    print(f"Generated {len(jobs)} wallpaper(s). Active desktop unchanged.")


if __name__ == "__main__":
    main()
