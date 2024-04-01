
local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
    refactor = {
        highlight_current_scope = {
            enable = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        highlight_definitions = {
            enable = true,
            updatetime = 10,
            clear_on_cursor_move = false,
        },
        navigation = {
          enable = true,
          keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
}

local treesitter_context = require'treesitter-context'

treesitter_context.setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    show_all_context = true,
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            "function",
            "method",
            "for",
            "while",
            "if",
            "switch",
            "case",
        },
    },
})


