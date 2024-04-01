require('lualine').setup {
    options = {
        disabled_filetypes = { 'NvimTree','__vista__'},
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            {
                'mode',
                separator = nil,      -- Determines what separator to use for the component.
                cond = nil,           -- Condition function, the component is loaded when the function returns `true`.
                color = nil, -- The default is your theme's color for that section and mode.
                type = nil,
                padding = 1, -- Adds padding to the left and right of components.
                             -- Padding can be specified to left or right independently, e.g.:
                             --   padding = { left = left_padding, right = right_padding }

                fmt = nil,   -- Format function, formats the component's output.
                on_click = nil, -- takes a function that is called when component is clicked with mouse.
                             -- the function receives several arguments
                             -- - number of clicks incase of multiple clicks
                             -- - mouse button used (l(left)/r(right)/m(middle)/...)
                             -- - modifiers pressed (s(shift)/c(ctrl)/a(alt)/m(meta)...)
            }
        },
        lualine_c = {
            {
                'buffers',
                show_filename_only = true,   -- Shows shortened relative path when set to false.
                hide_filename_extension = false,   -- Hide filename extension when set to true.
                show_modified_status = true, -- Shows indicator when the buffer is modified.

                mode = 4, -- 0: Shows buffer name
                          -- 1: Shows buffer index
                          -- 2: Shows buffer name + buffer index
                          -- 3: Shows buffer number
                          -- 4: Shows buffer name + buffer number

                max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                                                    -- it can also be a function that returns
                                                    -- the value of `max_length` dynamically.
                filetype_names = {
                  TelescopePrompt = 'Telescope',
                }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

                -- buffers_color = {
                --   -- Same values as the general color option can be used here.
                --   active = 'lualine_{section}_normal',     -- Color for active buffer.
                --   inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
                -- },

                symbols = {
                  modified = '●',      -- Text to show when the buffer is modified
                  alternate_file = '#', -- Text to show to identify the alternate file
                  directory =  '',     -- Text to show when the buffer is a directory
                },
            }
        },
        lualine_b = {
            'diff',
            {
                'diagnostics',

                sources = { 'nvim_lsp', 'coc' },

                -- Displays diagnostics for the defined severity types
                sections = { 'error', 'warn', 'info', 'hint' },
                -- diagnostics_color = {
                --   -- Same values as the general color option can be used here.
                --   error = 'DiagnosticError', -- Changes diagnostics' error color.
                --   warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                --   info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                --   hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                -- },
                symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false,   -- Show diagnostics even if there are none.
            }
        },
        lualine_x = {
            'encoding',
            {
                'fileformat',
                symbols = {
                    unix = '', -- e712
                    dos = '',  -- e70f
                    mac = '',  -- e711
                }
            },
            {
                'filetype',
                colored = true,   -- Displays filetype icon in color if set to true
                icon_only = true, -- Display only an icon for filetype
            }
        },
        lualine_y = {},
        lualine_z = {'location'}
    }
}
