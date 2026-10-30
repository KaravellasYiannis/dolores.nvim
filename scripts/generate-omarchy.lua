-- Run with: nvim -l scripts/generate-omarchy.lua [--output DIR] [--wallpaper FILE] [--force]
local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h")
package.path = root .. "/lua/?.lua;" .. package.path
local palettes = require("dolores.palettes")
local output = vim.fn.expand("~/.config/omarchy/themes")
local wallpaper, force
local i = 1
while i <= #arg do
    local option = arg[i]
    if option == "--output" or option == "--wallpaper" then
        i = i + 1
        assert(arg[i], "Missing value for " .. option)
        local path = vim.fn.fnamemodify(vim.fn.expand(arg[i]), ":p"):gsub("/$", "")
        if option == "--output" then
            output = path
        else
            wallpaper = path
        end
    elseif option == "--force" then
        force = true
    else
        error("Unknown option: " .. option)
    end
    i = i + 1
end

local function brightness(hex)
    local r, g, b = hex:match("#(%x%x)(%x%x)(%x%x)")
    return 0.2126 * tonumber(r, 16) + 0.7152 * tonumber(g, 16) + 0.0722 * tonumber(b, 16)
end

local function mix(a, b, amount)
    local channels = {}
    for start = 2, 6, 2 do
        local x, y = tonumber(a:sub(start, start + 1), 16), tonumber(b:sub(start, start + 1), 16)
        channels[#channels + 1] = math.floor(x * (1 - amount) + y * amount + 0.5)
    end
    return string.format("#%02x%02x%02x", unpack(channels))
end

local function colors(p)
    local dark = brightness(p.bg) < brightness(p.text)
    return {
        { "mode", dark and "dark" or "light" },
        { "accent", p.c12 },
        { "selection", p.c4 },
        { "selection_background", p.c4 },
        { "selection_foreground", p.text },
        { "muted", p.c5 },
        { "background", p.bg },
        { "dark_background", mix(p.bg, "#000000", 0.12) },
        { "darker_background", mix(p.bg, "#000000", 0.24) },
        { "lighter_background", dark and p.c3 or p.c1 },
        { "foreground", p.text },
        { "dark_foreground", p.c5 },
        { "light_foreground", p.c6 },
        { "bright_foreground", p.text },
        { "red", p.c11 },
        { "yellow", p.c8 },
        { "orange", p.c13 },
        { "green", p.c10 },
        { "cyan", p.c16 },
        { "blue", p.c12 },
        { "magenta", p.c14 },
        { "brown", p.c9 },
        { "bright_red", p.c11 },
        { "bright_yellow", p.c8 },
        { "bright_green", p.c10 },
        { "bright_cyan", p.c16 },
        { "bright_blue", p.c12 },
        { "bright_magenta", p.c14 },
    }
end

local themes = {}
for _, family in ipairs(vim.fn.sort(vim.tbl_keys(palettes))) do
    local scheme = family == "dolores" and family or "dolores-" .. family
    for _, mode in ipairs({ "dark", "light" }) do
        if palettes[family][mode] then
            local name = scheme .. "-" .. mode
            local dir = output .. "/" .. name
            assert(force or vim.fn.getftype(dir) == "", "Already exists: " .. dir .. " (use --force to back up and replace)")
            themes[#themes + 1] = { name = name, dir = dir, scheme = scheme, mode = mode, palette = palettes[family][mode] }
        end
    end
end

-- Snapshot the wallpaper outside the current theme staging directory: Omarchy
-- replaces that directory on every switch. All generated themes share this copy.
local shared_wallpaper
if wallpaper then
    assert(vim.fn.filereadable(wallpaper) == 1, "Cannot read wallpaper: " .. wallpaper)
    wallpaper = assert(vim.uv.fs_realpath(wallpaper))
    local extension = wallpaper:match("%.([%w]+)$")
    assert(extension and vim.tbl_contains({ "jpg", "jpeg", "png", "gif", "bmp", "webp" }, extension:lower()), "Unsupported wallpaper format")
    vim.fn.mkdir(output, "p")
    shared_wallpaper = output .. "/.dolores-wallpaper." .. extension:lower()
    assert(vim.fn.getftype(shared_wallpaper) == "", "Wallpaper snapshot already exists: " .. shared_wallpaper)
    assert(vim.uv.fs_copyfile(wallpaper, shared_wallpaper))
else
    local snapshots = vim.fn.glob(output .. "/.dolores-wallpaper.*", false, true)
    assert(#snapshots <= 1, "Multiple wallpaper snapshots found; keep only the one you want")
    shared_wallpaper = snapshots[1]
end

for _, theme in ipairs(themes) do
    if vim.fn.getftype(theme.dir) ~= "" then
        local backup_root = output .. "-backups/" .. os.date("%Y%m%d-%H%M%S")
        local backup = backup_root .. "/" .. theme.name
        assert(vim.fn.getftype(backup) == "", "Backup already exists: " .. backup)
        vim.fn.mkdir(backup_root, "p")
        assert(vim.uv.fs_rename(theme.dir, backup))
    end
    vim.fn.mkdir(theme.dir, "p")
    local lines = { "# Generated from dolores.nvim; edit the Lua palettes and regenerate." }
    for _, color in ipairs(colors(theme.palette)) do
        lines[#lines + 1] = string.format('%s = "%s"', color[1], color[2])
    end
    assert(vim.fn.writefile(lines, theme.dir .. "/colors.toml") == 0)
    local spec = string.format([[
return {
    {
        "pompos02/dolores.nvim",
        dir = %q,
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = %q
            require("dolores").setup({})
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = { colorscheme = %q },
    },
}
]], root, theme.mode, theme.scheme)
    assert(vim.fn.writefile(vim.split(spec, "\n", { plain = true }), theme.dir .. "/neovim.lua") == 0)
    if shared_wallpaper then
        vim.fn.mkdir(theme.dir .. "/backgrounds", "p")
        assert(vim.uv.fs_symlink(shared_wallpaper, theme.dir .. "/backgrounds/current." .. shared_wallpaper:match("%.([%w]+)$")))
    end
    -- The selector needs a theme-local preview even when wallpapers are stored
    -- in Omarchy's separate user-background directory.
    local user_backgrounds = vim.fn.expand("~/.config/omarchy/backgrounds/") .. theme.name
    local glows = vim.fn.glob(user_backgrounds .. "/00-glow-*.png", false, true)
    if #glows > 0 then
        assert(vim.uv.fs_symlink(glows[1], theme.dir .. "/preview.png"))
    end
    print("Generated " .. theme.name)
end
print(string.format("%d themes generated. No active theme was changed.", #themes))
