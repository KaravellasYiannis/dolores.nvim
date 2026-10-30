-- Run with: nvim -u NONE -l scripts/test-omarchy.lua
local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h")
vim.opt.runtimepath:prepend(root)
local temporary = vim.env.TMPDIR or "/tmp/opencode"
vim.fn.mkdir(temporary, "p")
local output = assert(vim.uv.fs_mkdtemp(temporary .. "/dolores-test-XXXXXX"))
arg = { "--output", output }
dofile(root .. "/scripts/generate-omarchy.lua")

local count = 0
for _, dir in ipairs(vim.fn.glob(output .. "/dolores-*", false, true)) do
    local spec = dofile(dir .. "/neovim.lua")
    assert(spec[1].dir == root)
    spec[1].config()
    local mode = vim.o.background
    local scheme = spec[2].opts.colorscheme
    vim.cmd.colorscheme(scheme)
    local family = scheme == "dolores" and scheme or scheme:sub(9)
    local palette = require("dolores.palettes")[family][mode]
    assert(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == tonumber(palette.bg:sub(2), 16), dir)
    local colors = {}
    for _, line in ipairs(vim.fn.readfile(dir .. "/colors.toml")) do
        local key, value = line:match('^([%w_]+) = "(.-)"$')
        if key then
            colors[key] = value
            assert(key == "mode" or value:match("^#%x%x%x%x%x%x$"), line)
        end
    end
    assert(colors.background == palette.bg)
    assert(colors.foreground == palette.text)
    assert(colors.accent == palette.c12)
    assert(colors.bright_magenta == palette.c14)
    count = count + 1
end
assert(count == 20, "Expected 20 palette variants")

-- Existing output must not be overwritten without explicit permission.
local before = vim.fn.readfile(output .. "/dolores-dark/colors.toml")
assert(not pcall(dofile, root .. "/scripts/generate-omarchy.lua"))
assert(vim.deep_equal(before, vim.fn.readfile(output .. "/dolores-dark/colors.toml")))

-- Preserve palette override and dark-only fallback behavior after data extraction.
require("dolores").setup({ palette = { bg = "#123456" } })
vim.o.background = "light"
vim.cmd.colorscheme("dolores-stratos")
assert(require("dolores.palette").bg == "#123456")
assert(require("dolores.palettes").stratos.dark.bg == "#161616")

-- Remove only the test-owned temporary directory.
vim.fn.delete(output, "rf")
print("PASS: 20 themes, exact Neovim palettes, overwrite protection, overrides and fallback")
