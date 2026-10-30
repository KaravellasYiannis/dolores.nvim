local options = require("dolores.config").options
local palette = require("dolores.palettes")

local function apply_overrides(colors)
    if options.palette == nil or not next(options.palette) then
        return colors
    end

    local merged = vim.deepcopy(colors)
    for key, value in pairs(options.palette) do
        merged[key] = value
    end

    return merged
end

local function active_family()
    if vim.g.colors_name == nil or vim.g.colors_name == "dolores" then
        return "dolores"
    end

    local family = vim.g.colors_name:match("^dolores%-(.+)$")
    if family ~= nil and palette[family] ~= nil then
        return family
    end

    return "dolores"
end

local function active_mode(family)
    local background = vim.opt.background:get()
    if palette[family][background] ~= nil then
        return background
    end

    if palette[family].dark ~= nil then
        return "dark"
    end

    return "light"
end

local family = active_family()

return apply_overrides(palette[family][active_mode(family)])
