local util = require "lspconfig/util"
local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim", "mp" },
                },
            },
        },
    },
    -- c/c++
    ccls = {
		filetypes = { "c", "cpp", "objc", "pbjcpp" },
		root_dir = function()
				return vim.fn.getcwd()
		end,
		autostart = true,
		single_file_support = true,
    },
    gopls = {
        cmd = {"gopls", "serve"},
        filetypes = {"go", "gomod"},
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
            staticcheck = true,
            },
        },
    },
	cssls = {},
	jsonls = {},
	html = {},
    -- also:
    -- for zk see lua/user/plugins/zk.lua
    -- for null-ls see lua/user/plugins/null-ls.lua
}

return servers
