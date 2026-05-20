local api = vim.api
local keymap = vim.keymap

api.nvim_create_autocmd("FileType", {
    pattern = { "python", "javascript", "typescript", "c" }, 
    callback = function(args)
        local cmd
        if args.match == "python" then
            cmd = { "pyright-langserver", "--stdio" }
        elseif args.match == "javascript" or args.match == "typescript" then
            cmd = { "typescript-language-server", "--stdio" }
        elseif args.match == "c" then
            cmd = { "clangd" }
        end

        if cmd and vim.fn.executable(cmd[1]) == 1 then
            local root_markers = { '.git', 'package.json', 'pyproject.toml' }
            local found = vim.fs.find(root_markers, { upward = true, path = vim.api.nvim_buf_get_name(args.buf) })[1]
            local root_dir = found and vim.fs.dirname(found) or vim.fn.getcwd()

            vim.lsp.start({
                name = cmd[1],
                cmd = cmd,
                root_dir = root_dir,
            })
        end
    end,
})

api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        
        vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    end,
})
