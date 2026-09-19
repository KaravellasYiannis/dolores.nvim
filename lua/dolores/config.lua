---@alias PaletteColor
---| "bg"
---| "text"
---| "operator"
---| "visual"
---| "c1"
---| "c2"
---| "c3"
---| "c4"
---| "c5"
---| "c6"
---| "c7"
---| "c8"
---| "c9"
---| "c10"
---| "c11"
---| "c12"
---| "c13"
---| "c14"
---| "c15"
---| "c16"
---| "c17"
---| "c18"
---@alias Highlight { link: string, inherit: boolean } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, inherit: boolean }

local config = {}

---@class Options
config.options = {
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
    ---@type table<string, string>
    palette = {},
    ---@type table<string, string | PaletteColor>
    groups = {
        border = "c5",
        link = "c16",
        panel = "c3",

        error = "c11",
        hint = "c12",
        info = "c14",
        ok = "c10",
        warn = "c8",
        note = "c10",
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
    ---@type table<string, Highlight>
    highlight_groups = {},
    ---Called before each highlight group, before setting the highlight.
    ---@param group string
    ---@param highlight Highlight
    ---@param palette table<string, string>
    ---@diagnostic disable-next-line: unused-local
    before_highlight = function(group, highlight, palette) end,
}

local function migrate(options)
    if options.bold_vert_split then
        local border = options.groups.border or "c5"
        options.highlight_groups["VertSplit"] = { fg = border, bg = border }
        options.highlight_groups["WinSeparator"] = { fg = border, bg = border }
    end

    if options.disable_background then
        options.highlight_groups["Normal"] = { bg = "NONE" }
    end

    if options.disable_float_background then
        options.highlight_groups["NormalFloat"] = { bg = "NONE" }
    end

    options.dim_inactive_windows = options.dim_nc_background or options.dim_inactive_windows

    if options.groups.background ~= nil then
        options.highlight_groups["Normal"] = { bg = options.groups.background }
    end

    if options.groups.comment ~= nil then
        options.highlight_groups["Comment"] = { fg = options.groups.comment }
    end

    if options.groups.punctuation ~= nil then
        options.highlight_groups["@punctuation"] = { fg = options.groups.punctuation }
    end

    options.styles.transparency = (options.disable_background and options.disable_float_background)
        or options.styles.transparency

    options.styles.bold = not (options.disable_bold or options.disable_bolds) and options.styles.bold or false
    options.styles.italic = not (options.disable_italic or options.disable_italics) and options.styles.italic or false

    if type(options.groups.headings) == "string" then
        options.groups.h1 = options.groups.headings
        options.groups.h2 = options.groups.headings
        options.groups.h3 = options.groups.headings
        options.groups.h4 = options.groups.headings
        options.groups.h5 = options.groups.headings
        options.groups.h6 = options.groups.headings
    elseif type(options.groups.headings) == "table" then
        options.groups.h1 = options.groups.headings.h1 or options.groups.h1
        options.groups.h2 = options.groups.headings.h2 or options.groups.h2
        options.groups.h3 = options.groups.headings.h3 or options.groups.h3
        options.groups.h4 = options.groups.headings.h4 or options.groups.h4
        options.groups.h5 = options.groups.headings.h5 or options.groups.h5
        options.groups.h6 = options.groups.headings.h6 or options.groups.h6
    end
    options.groups.headings = nil

    return options
end

---@param options Options | nil
function config.extend_options(options)
    config.options = vim.tbl_deep_extend("force", config.options, options or {})

    if config.options.enable.migrations then
        config.options = migrate(config.options)
    end
end

return config
