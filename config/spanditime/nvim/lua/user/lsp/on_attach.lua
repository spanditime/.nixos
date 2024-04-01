local function map_keys(client, bufnr)
    local function keymap(mode, key, cmd)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
    end

    -- stylua: ignore start
    keymap("n", "<leader>lgD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
    keymap("n", "<leader>lgd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
    keymap("n", "<leader>lK", "<Cmd>lua vim.lsp.buf.hover()<CR>")
    keymap("n", "<leader>lgi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    keymap("n", "<leader><C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    keymap("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
    keymap("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
    keymap("n", "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
    keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    keymap("n", "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    keymap("n", "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<CR>")
    keymap("n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>")
    keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    -- keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
    keymap("n", "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    keymap("v", "<leader>lc", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
    -- stylua: ignore end

    if client.server_capabilities.documentFormattingProvider then
        -- stylua: ignore
        keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")
    elseif client.server_capabilities.documentRangeFormattingProvider then
        -- stylua: ignore
        keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")
    end
end

local on_attach = function(client, bufnr)
    -- disable sumneko_lua formatting as we use stylua via null-ls
    if client.name == "sumneko_lua" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    map_keys(client, bufnr)
end

return on_attach

