local options = require("dolores.config").options

local palette = {
    dolores = {
        dark = {
            bg = "#181818",   -- Normal, floats, signs, TabLineFill background
            c1 = "#101112",   -- dim inactive-window background
            c2 = "#1b1d1e",   -- inactive terminal statusline and label foreground contrast
            c3 = "#222425",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#2a2d2f",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#7a7a7a",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#a0a0a0",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#c0c0c0",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#c0c0c0", -- operators
            visual = "#96a6c8",   -- visual selection
            c7 = "#ffffff",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#f2d06b",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#756049",   -- comments and folded text
            c10 = "#73d936",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#ff5c5c",  -- errors, exceptions, SpellBad, search labels
            c12 = "#96a6c8",  -- functions, methods, fields, match highlights
            c13 = "#94B0A6",  -- types, imports, quickfix line/column numbers
            c14 = "#9e95c7",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#f2d06b",  -- CurSearch background
            c16 = "#8a8a8a",  -- special comments, messages, links, cyan/teal accents
            c17 = "#181818",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#34383a",  -- cursor-like surfaces and subdued rendered comments
        },
        light = {
            bg = "#f5f5f5",   -- Normal, floats, signs, TabLineFill background
            c1 = "#f5f5f5",   -- dim inactive-window background
            c2 = "#e8e8e8",   -- inactive terminal statusline and label foreground contrast
            c3 = "#e8e8e8",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#d4d4d4",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#777777",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#666666",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#16181a",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#16181a", -- operators
            visual = "#b21c55",   -- visual selection
            c7 = "#d56f4f",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#997b00",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#888888",   -- comments and folded text
            c10 = "#008b0c",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#d11500",  -- errors, exceptions, SpellBad, search labels
            c12 = "#b21c55",  -- functions, methods, fields, match highlights
            c13 = "#008c99",  -- types, imports, quickfix line/column numbers
            c14 = "#a018ff",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#997b00",  -- CurSearch background
            c16 = "#d100bf",  -- special comments, messages, links, cyan/teal accents
            c17 = "#f5f5f5",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#c8c8c8",  -- cursor-like surfaces and subdued rendered comments
        },
    },
    kyriazis = {
        dark = {
            bg = "#1d1f21",   -- Normal, floats, signs, TabLineFill background
            c1 = "#1d1f21",   -- dim inactive-window background
            c2 = "#282a2e",   -- inactive terminal statusline and label foreground contrast
            c3 = "#282a2e",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#373b41",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#4d5057",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#969896",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#c5c8c6",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#c5c8c6", -- operators
            visual = "#81a2be",   -- visual selection
            c7 = "#cc6666",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#f0c674",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#969896",   -- comments and folded text
            c10 = "#b5bd68",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#cc6666",  -- errors, exceptions, SpellBad, search labels
            c12 = "#81a2be",  -- functions, methods, fields, match highlights
            c13 = "#f0c674",  -- types, imports, quickfix line/column numbers
            c14 = "#b294bb",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#f0c674",  -- CurSearch background
            c16 = "#8abeb7",  -- special comments, messages, links, cyan/teal accents
            c17 = "#1d1f21",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#4d5057",  -- cursor-like surfaces and subdued rendered comments
        },
        light = {
            bg = "#ffffff",   -- Normal, floats, signs, TabLineFill background
            c1 = "#ffffff",   -- dim inactive-window background
            c2 = "#efefef",   -- inactive terminal statusline and label foreground contrast
            c3 = "#efefef",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#d6d6d6",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#8e908c",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#8e908c",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#4d4d4c",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#4d4d4c", -- operators
            visual = "#4271ae",   -- visual selection
            c7 = "#c82829",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#eab700",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#8e908c",   -- comments and folded text
            c10 = "#718c00",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#c82829",  -- errors, exceptions, SpellBad, search labels
            c12 = "#4271ae",  -- functions, methods, fields, match highlights
            c13 = "#eab700",  -- types, imports, quickfix line/column numbers
            c14 = "#8959a8",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#eab700",  -- CurSearch background
            c16 = "#3e999f",  -- special comments, messages, links, cyan/teal accents
            c17 = "#ffffff",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#efefef",  -- cursor-like surfaces and subdued rendered comments
        },
    },
    kif = {
        dark = {
            bg = "#112e2a",   -- Normal, floats, signs, TabLineFill background
            c1 = "#0b211d",   -- dim inactive-window background
            c2 = "#163732",   -- inactive terminal statusline and label foreground contrast
            c3 = "#1b413b",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#26524b",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#52756e",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#8eaca5",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#d8c5a7",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#d8c5a7", -- operators
            visual = "#c1d1e3",   -- visual selection
            c7 = "#ffffff",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#f2d06b",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#21d813",   -- comments and folded text
            c10 = "#2ea87e",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#F43841",  -- errors, exceptions, SpellBad, search labels
            c12 = "#c1d1e3",  -- functions, methods, fields, match highlights
            c13 = "#8cde94",  -- types, imports, quickfix line/column numbers
            c14 = "#7ad0c6",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#f2d06b",  -- CurSearch background
            c16 = "#748a92",  -- special comments, messages, links, cyan/teal accents
            c17 = "#112e2a",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#3b655d",  -- cursor-like surfaces and subdued rendered comments
        },
    },
    thalasses = {
        dark = {
            bg = "#282c34",   -- Normal, floats, signs, TabLineFill background
            c1 = "#21252b",   -- dim inactive-window background
            c2 = "#2c323c",   -- inactive terminal statusline and label foreground contrast
            c3 = "#313640",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#3b4048",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#5c6370",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#7f848e",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#abb2bf",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#abb2bf", -- operators
            visual = "#61afef",   -- visual selection
            c7 = "#e6efff",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#e5c07b",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#5c6370",   -- comments and folded text
            c10 = "#98c379",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#e06c75",  -- errors, exceptions, SpellBad, search labels
            c12 = "#61afef",  -- functions, methods, fields, match highlights
            c13 = "#e5c07b",  -- types, imports, quickfix line/column numbers
            c14 = "#c678dd",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#e5c07b",  -- CurSearch background
            c16 = "#56b6c2",  -- special comments, messages, links, cyan/teal accents
            c17 = "#282c34",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#4b5263",  -- cursor-like surfaces and subdued rendered comments
        },
        light = {
            bg = "#fafafa",   -- Normal, floats, signs, TabLineFill background
            c1 = "#f0f0f1",   -- dim inactive-window background
            c2 = "#e5e7eb",   -- inactive terminal statusline and label foreground contrast
            c3 = "#dfe3e8",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#d7dce3",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#a0a1a7",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#696c77",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#383a42",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#383a42", -- operators
            visual = "#4078f2",   -- visual selection
            c7 = "#202227",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#c18401",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#a0a1a7",   -- comments and folded text
            c10 = "#50a14f",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#e45649",  -- errors, exceptions, SpellBad, search labels
            c12 = "#4078f2",  -- functions, methods, fields, match highlights
            c13 = "#986801",  -- types, imports, quickfix line/column numbers
            c14 = "#a626a4",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#c18401",  -- CurSearch background
            c16 = "#0184bc",  -- special comments, messages, links, cyan/teal accents
            c17 = "#fafafa",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#c9cdd4",  -- cursor-like surfaces and subdued rendered comments
        },
    },
    stratos = {
        dark = {
            bg = "#161616",   -- Normal, floats, signs, TabLineFill background
            c1 = "#161616",   -- dim inactive-window background
            c2 = "#262626",   -- inactive terminal statusline and label foreground contrast
            c3 = "#363636",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#464646",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#606060",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#a59f85",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#B7A18B",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#B7A18B", -- operators
            visual = "#0B0B63",   -- visual selection
            c7 = "#9E7B2B",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#e6db74",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#60625F",   -- comments and folded text
            c10 = "#4F6F0E",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#C51417",  -- errors, exceptions, SpellBad, search labels
            c12 = "#9E7B2B",  -- functions, methods, fields, match highlights
            c13 = "#9E7B2B",  -- types, imports, quickfix line/column numbers
            c14 = "#B7A18B",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#d100bf",  -- CurSearch background
            c16 = "#a1efe4",  -- special comments, messages, links, cyan/teal accents
            c17 = "#272822",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#49483e",  -- cursor-like surfaces and subdued rendered comments
        },
    },
    mitropanos = {
        dark = {
            bg = "#181818",   -- Normal, floats, signs, TabLineFill background
            c1 = "#101010",   -- dim inactive-window background
            c2 = "#202020",   -- inactive terminal statusline and label foreground contrast
            c3 = "#282828",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#383838",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#585858",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#676666",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#e4e4ef",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#e4e4ef", -- operators
            visual = "#96a6c8",   -- visual selection
            c7 = "#ffdd33",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#ffdd33",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#B17F3D",   -- comments and folded text
            c10 = "#73d936",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#f43841",  -- errors, exceptions, SpellBad, search labels
            c12 = "#96a6c8",  -- functions, methods, fields, match highlights
            c13 = "#94B0A6",  -- types, imports, quickfix line/column numbers
            c14 = "#9e95c7",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#ffdd33",  -- CurSearch background
            c16 = "#565f73",  -- special comments, messages, links, cyan/teal accents
            c17 = "#181818",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#52494e",  -- cursor-like surfaces and subdued rendered comments
        },
        light = {
            bg = "#ffffff",   -- Normal, floats, signs, TabLineFill background
            c1 = "#f4f4ff",   -- dim inactive-window background
            c2 = "#f5f5f5",   -- inactive terminal statusline and label foreground contrast
            c3 = "#f4f4ff",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#e4e4e4",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#95a99f",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#565f73",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#000000",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#000000", -- operators
            visual = "#0000ff",   -- visual selection
            c7 = "#d92f2f",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#de7a35",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#95a99f",   -- comments and folded text
            c10 = "#4fb324",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#d92f2f",  -- errors, exceptions, SpellBad, search labels
            c12 = "#0000ff",  -- functions, methods, fields, match highlights
            c13 = "#14a8bb",  -- types, imports, quickfix line/column numbers
            c14 = "#a022c5",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#de7a35",  -- CurSearch background
            c16 = "#6c748a",  -- special comments, messages, links, cyan/teal accents
            c17 = "#ffffff",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#52494e",  -- cursor-like surfaces and subdued rendered comments
        },
    },
    thes = {
        dark = {
            bg = "#16181a",   -- Normal, floats, signs, TabLineFill background
            c1 = "#16181a",   -- dim inactive-window background
            c2 = "#1e2124",   -- inactive terminal statusline and label foreground contrast
            c3 = "#1e2124",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#3c4048",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#7b8496",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#7b8496",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#ffffff",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#ffffff", -- operators
            visual = "#5ea1ff",   -- visual selection
            c7 = "#ffbd5e",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#f1ff5e",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#7b8496",   -- comments and folded text
            c10 = "#5eff6c",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#ff4545",  -- errors, exceptions, SpellBad, search labels
            c12 = "#5ea1ff",  -- functions, methods, fields, match highlights
            c13 = "#bd5eff",  -- types, imports, quickfix line/column numbers
            c14 = "#ff5ea0",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#f1ff5e",  -- CurSearch background
            c16 = "#ff5ef1",  -- special comments, messages, links, cyan/teal accents
            c17 = "#16181a",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#3c4048",  -- cursor-like surfaces and subdued rendered comments
        },
        light = {
            bg = "#f5f5f5",   -- Normal, floats, signs, TabLineFill background
            c1 = "#f5f5f5",   -- dim inactive-window background
            c2 = "#e8e8e8",   -- inactive terminal statusline and label foreground contrast
            c3 = "#e8e8e8",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#cbcbcb",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#7b8496",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#7b8496",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#16181a",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#16181a", -- operators
            visual = "#b21c55",   -- visual selection
            c7 = "#008c99",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#997b00",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#997b00",   -- comments and folded text
            c10 = "#008b0c",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#d11500",  -- errors, exceptions, SpellBad, search labels
            c12 = "#b21c55",  -- functions, methods, fields, match highlights
            c13 = "#0057d1",  -- types, imports, quickfix line/column numbers
            c14 = "#a018ff",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#997b00",  -- CurSearch background
            c16 = "#d100bf",  -- special comments, messages, links, cyan/teal accents
            c17 = "#f5f5f5",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#acacac",  -- cursor-like surfaces and subdued rendered comments
        },
    },
    ["sotiria-bellou"] = {
        dark = {
            bg = "#282828",   -- Normal, floats, signs, TabLineFill background
            c1 = "#1b1b1b",   -- dim inactive-window background
            c2 = "#32302f",   -- inactive terminal statusline and label foreground contrast
            c3 = "#45403d",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#5a524c",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#7c6f64",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#a89984",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#d4be98",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#d4be98", -- operators
            visual = "#7daea3",   -- visual selection
            c7 = "#ea6962",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#d8a657",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#928374",   -- comments and folded text
            c10 = "#89b482",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#ea6962",  -- errors, exceptions, SpellBad, search labels
            c12 = "#7daea3",  -- functions, methods, fields, match highlights
            c13 = "#d8a657",  -- types, imports, quickfix line/column numbers
            c14 = "#d3869b",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#d8a657",  -- CurSearch background
            c16 = "#7daea3",  -- special comments, messages, links, cyan/teal accents
            c17 = "#282828",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#5a524c",  -- cursor-like surfaces and subdued rendered comments
        },
        light = {
            bg = "#fbf1c7",   -- Normal, floats, signs, TabLineFill background
            c1 = "#f2e5bc",   -- dim inactive-window background
            c2 = "#f4e8be",   -- inactive terminal statusline and label foreground contrast
            c3 = "#eee0b7",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#ddccab",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#a89984",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#7c6f64",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#654735",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#654735", -- operators
            visual = "#45707a",   -- visual selection
            c7 = "#c14a4a",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#b47109",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#928374",   -- comments and folded text
            c10 = "#4c7a5d",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#c14a4a",  -- errors, exceptions, SpellBad, search labels
            c12 = "#45707a",  -- functions, methods, fields, match highlights
            c13 = "#b47109",  -- types, imports, quickfix line/column numbers
            c14 = "#945e80",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#b47109",  -- CurSearch background
            c16 = "#45707a",  -- special comments, messages, links, cyan/teal accents
            c17 = "#fbf1c7",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#ddccab",  -- cursor-like surfaces and subdued rendered comments
        },
    },
    glykeria = {
        dark = {
            bg = "#1d2021",   -- Normal, floats, signs, TabLineFill background
            c1 = "#1d2021",   -- dim inactive-window background
            c2 = "#32302f",   -- inactive terminal statusline and label foreground contrast
            c3 = "#3c3836",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#504945",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#7c6f64",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#a89984",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#ebdbb2",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#ebdbb2", -- operators
            visual = "#83a598",   -- visual selection
            c7 = "#d3869b",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#fabd2f",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#8ec07c",   -- comments and folded text
            c10 = "#b8bb26",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#fb4934",  -- errors, exceptions, SpellBad, search labels
            c12 = "#83a598",  -- functions, methods, fields, match highlights
            c13 = "#fabd2f",  -- types, imports, quickfix line/column numbers
            c14 = "#fe8019",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#fabd2f",  -- CurSearch background
            c16 = "#8ec07c",  -- special comments, messages, links, cyan/teal accents
            c17 = "#282828",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#504945",  -- cursor-like surfaces and subdued rendered comments
        },
        light = {
            bg = "#fbf1c7",   -- Normal, floats, signs, TabLineFill background
            c1 = "#fbf1c7",   -- dim inactive-window background
            c2 = "#f3efd2",   -- inactive terminal statusline and label foreground contrast
            c3 = "#ebdbb2",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#d5c4a1",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#bdae93",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#7c6f64",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#3c3836",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#3c3836", -- operators
            visual = "#458588",   -- visual selection
            c7 = "#b16286",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#d79921",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#689d6a",   -- comments and folded text
            c10 = "#98971a",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#cc241d",  -- errors, exceptions, SpellBad, search labels
            c12 = "#458588",  -- functions, methods, fields, match highlights
            c13 = "#d79921",  -- types, imports, quickfix line/column numbers
            c14 = "#d65d0e",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#d79921",  -- CurSearch background
            c16 = "#689d6a",  -- special comments, messages, links, cyan/teal accents
            c17 = "#fbf1c7",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#bdae93",  -- cursor-like surfaces and subdued rendered comments
        },
    },
    drapetis = {
        dark = {
            bg = "#1c1c1c",   -- Normal, floats, signs, TabLineFill background
            c1 = "#1e2021",   -- dim inactive-window background
            c2 = "#2a2a2a",   -- inactive terminal statusline and label foreground contrast
            c3 = "#2a2a2a",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#3c4048",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#7b8496",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#7b8496",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#ececec",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#838b8f", -- operators
            visual = "#ececec",   -- visual selection
            c7 = "#838b8f",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#f1ff5e",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#627a5f",   -- comments and folded text
            c10 = "#788674",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#ff4545",  -- errors, exceptions, SpellBad, search labels
            c12 = "#ececec",  -- functions, methods, fields, match highlights
            c13 = "#ceaf63",  -- types, imports, quickfix line/column numbers
            c14 = "#ececec",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#f1ff5e",  -- CurSearch background
            c16 = "#ffbd5e",  -- special comments, messages, links, cyan/teal accents
            c17 = "#16181a",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#3c4048",  -- cursor-like surfaces and subdued rendered comments
        }
    },
    edelvais = {
        dark = {
            bg = "#101010",   -- Normal, floats, signs, TabLineFill background
            c1 = "#101010",   -- dim inactive-window background
            c2 = "#161616",   -- inactive terminal statusline and label foreground contrast
            c3 = "#1C1C1C",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#282828",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#505050",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#A0A0A0",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#FFFFFF",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#A0A0A0", -- operators
            visual = "#A0A0A0",   -- visual selection
            c7 = "#cccccc",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#FFC799",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#fcbcd4",   -- comments and folded text
            c10 = "#99FFE4",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#FF8080",  -- errors, exceptions, SpellBad, search labels
            c12 = "#FFC799",  -- functions, methods, fields, match highlights
            c13 = "#FFC799",  -- types, imports, quickfix line/column numbers
            c14 = "#99FFE4",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#FFC799",  -- CurSearch background
            c16 = "#FFC799",  -- special comments, messages, links, cyan/teal accents
            c17 = "#161616",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#343434",  -- cursor-like surfaces and subdued rendered comments
        },
        light = {
            bg = "#FAFAF8",   -- Normal, floats, signs, TabLineFill background
            c1 = "#F4F4F1",   -- dim inactive-window background
            c2 = "#F0F0ED",   -- inactive terminal statusline and label foreground contrast
            c3 = "#EAEAE6",   -- ColorColumn, CursorLine, CursorColumn, StatusLine, TabLine, popup menu
            c4 = "#DEDEDA",   -- selected tab, terminal statusline, QuickFixLine, NonText, indent guides
            c5 = "#9A9A94",   -- line numbers, borders, fold column, separators, inlay hints
            c6 = "#62625F",   -- secondary UI text, inactive statusline/tabline, popup menu text
            text = "#000000",     -- Normal text, identifiers, punctuation, active statusline/tabline text
            operator = "#181816", -- operators
            visual = "#62625F",   -- visual selection
            c7 = "#181816",   -- keywords, conditionals, repeats, strong prompts
            c8 = "#A64F13",   -- warning/yellow diagnostics and terminal yellow
            c9 = "#A4496B",   -- comments and folded text
            c10 = "#007A65",  -- strings, quickfix filenames, success/green diagnostics
            c11 = "#C23B3B",  -- errors, exceptions, SpellBad, search labels
            c12 = "#A64F13",  -- functions, methods, fields, match highlights
            c13 = "#A64F13",  -- types, imports, quickfix line/column numbers
            c14 = "#A64F13",  -- constants, booleans, numbers, labels, titles, directories
            c15 = "#A64F13",  -- CurSearch background
            c16 = "#A64F13",  -- special comments, messages, links, cyan/teal accents
            c17 = "#F0F0ED",  -- selected completion, picker, buffer, and tab backgrounds
            c18 = "#D2D2CD",  -- cursor-like surfaces and subdued rendered comments
        },
    },
}

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
