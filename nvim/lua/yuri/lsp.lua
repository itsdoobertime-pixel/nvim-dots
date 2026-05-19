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
            vim.lsp.start({
                name = cmd[1],
                cmd = cmd,
                root_dir = vim.fs.dirname(vim.fs.find({'.git', 'package.json', 'pyproject.toml'}, { upward = true })[1]),
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
