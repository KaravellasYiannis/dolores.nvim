-- Run with: nvim -u NONE -l scripts/test-lualine.lua
local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h")
vim.opt.runtimepath:prepend(root)
-- Set LUALINE_PATH to also exercise lualine's real auto-theme loader.
if vim.env.LUALINE_PATH then
    vim.opt.runtimepath:append(vim.env.LUALINE_PATH)
end

local function luminance(color)
    local value = assert(tonumber(color:sub(2), 16), color)
    local channels = {}
    for _, shift in ipairs({ 16, 8, 0 }) do
        local c = bit.band(bit.rshift(value, shift), 255) / 255
        channels[#channels + 1] = c <= 0.04045 and c / 12.92 or ((c + 0.055) / 1.055) ^ 2.4
    end
    return channels[1] * 0.2126 + channels[2] * 0.7152 + channels[3] * 0.0722
end

local function load_theme()
    if vim.env.LUALINE_PATH then
        return require("lualine.utils.loader").load_theme("auto")
    end
    local path = "lua/lualine/themes/" .. vim.g.colors_name .. ".lua"
    return dofile(assert(vim.api.nvim_get_runtime_file(path, false)[1], path))
end

local modes = { normal = "c14", insert = "c12", visual = "c15", replace = "c11", command = "c8", terminal = "c14" }
local failures = {}
local function check(p, transparent)
    local theme = load_theme()
    for mode, sections in pairs(theme) do
        for section, colors in pairs(sections) do
            local bg = colors.bg
            local cap = mode ~= "inactive" and section == "a"
            local base = mode == "inactive" or section == "c"
            if not cap then
                assert(bg == (base and (transparent and "NONE" or p.c2) or p.c4))
                assert(colors.fg == (mode == "inactive" and p.c6 or p.text))
            end
            if transparent and base then
                assert(bg == "NONE")
                -- The actual terminal background is unknown; use the palette surface.
                bg = p.c2
            end
            local a, b = luminance(colors.fg), luminance(bg)
            local ratio = (math.max(a, b) + 0.05) / (math.min(a, b) + 0.05)
            -- Badge colors use the palette directly, without per-theme correction.
            if not cap and ratio < 4.5 then
                failures[#failures + 1] = string.format("%s/%s/%s: %.2f:1", vim.g.colors_name, mode, section, ratio)
            end
        end
        if modes[mode] then
            assert(sections.a.bg == p[modes[mode]])
            assert(sections.a.gui == "bold")
            assert(sections.a.fg == p.bg)
            assert(sections.x == nil and sections.y == nil and sections.z == nil)
        else
            assert(mode == "inactive")
            assert(sections.a.gui == nil)
            assert(sections.b.fg == p.c6)
            assert(sections.c.fg == p.c6)
        end
    end
end

local count = 0
for family, variants in pairs(require("dolores.palettes")) do
    for background, p in pairs(variants) do
        vim.o.background = background
        local scheme = family == "dolores" and family or "dolores-" .. family
        vim.cmd.colorscheme(scheme)
        local text, surface = luminance(p.text), luminance(p.c4)
        assert((math.max(text, surface) + 0.05) / (math.min(text, surface) + 0.05) >= 4.5, scheme .. ": text/c4")
        for _, key in ipairs({ "c2", "c3" }) do
            local muted, bg = luminance(p.c6), luminance(p[key])
            local ratio = (math.max(muted, bg) + 0.05) / (math.min(muted, bg) + 0.05)
            if ratio < 4.5 then
                failures[#failures + 1] = scheme .. "/" .. background .. ": c6/" .. key .. " " .. ratio
            end
        end
        for _, transparent in ipairs({ false, true }) do
            require("dolores").setup({ styles = { transparency = transparent } })
            vim.cmd.colorscheme(scheme)
            check(p, transparent)
        end
        count = count + 1
    end
end
assert(count == 20, "Expected 20 palette variants")

-- Dark-only families must still work when Neovim requests a light background.
vim.o.background = "light"
require("dolores").setup({ styles = { transparency = false } })
vim.cmd.colorscheme("dolores-stratos")
check(require("dolores.palettes").stratos.dark, false)

-- Explicit user overrides are used as-is, without automatic color correction.
require("dolores").setup({ palette = { c14 = "navy", c6 = "gray", c4 = "white" } })
vim.cmd.colorscheme("dolores")
local theme = load_theme()
assert(theme.normal.a.bg == "navy")
assert(theme.normal.a.fg == require("dolores.palette").bg)
assert(theme.normal.b.bg == "white")
assert(theme.normal.b.fg == require("dolores.palette").text)
assert(theme.inactive.c.fg == "gray")

assert(#failures == 0, table.concat(failures, "\n"))
print("PASS: 20 named lualine palettes, middle-section contrast, transparency, overrides, reloads and fallback")
