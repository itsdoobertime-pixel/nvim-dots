local api = vim.api

api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.cmd("hi YuriDashHeader guibg=NONE guifg=#e8aeff gui=bold")
        vim.cmd("hi YuriDashSub guibg=NONE guifg=#bae1ff")
        vim.cmd("hi YuriDashKey guibg=NONE guifg=#ffb3ba gui=bold")
        vim.cmd("hi YuriDashText guibg=NONE guifg=#baffc9 gui=bold")
    end,
})

api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() ~= 0 or api.nvim_buf_get_name(0) ~= "" or vim.bo.filetype ~= "" then
            return
        end

        local buf = api.nvim_get_current_buf()
        vim.bo[buf].buftype = "nofile"
        vim.bo[buf].bufhidden = "wipe"
        vim.bo[buf].swapfile = false
        vim.bo[buf].buflisted = false
        vim.bo[buf].filetype = "yuridash"

        local win = api.nvim_get_current_win()
        vim.wo[win].number = false
        vim.wo[win].relativenumber = false
        vim.wo[win].signcolumn = "no"
        vim.wo[win].cursorline = false

        local width = api.nvim_win_get_width(win)
        local height = api.nvim_win_get_height(win)

        local pad_top = math.floor(height / 5)
        local pad_left = string.rep(" ", math.floor((width - 34) / 2))

        local logo = {}
        for _ = 1, pad_top do
            table.insert(logo, "")
        end

        table.insert(logo, pad_left .. " ██╗   ██╗██╗   ██╗██████╗ ██╗")
        table.insert(logo, pad_left .. " ╚██╗ ██╔╝██║   ██║██╔══██╗██║")
        table.insert(logo, pad_left .. "  ╚████╔╝ ██║   ██║██████╔╝██║")
        table.insert(logo, pad_left .. "   ╚██╔╝  ██║   ██║██╔══██╗██║")
        table.insert(logo, pad_left .. "    ██║   ╚██████╔╝██║  ██║██║")
        table.insert(logo, pad_left .. "    ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝")
        table.insert(logo, "")
        table.insert(logo, pad_left .. "    Yet Unother Refined Interface")
        table.insert(logo, "")
        table.insert(logo, "")
        table.insert(logo, pad_left .. "    ( e )  explore files")
        table.insert(logo, pad_left .. "    ( w )  new blank file")
        table.insert(logo, pad_left .. "    ( q )  quit neovim")

        api.nvim_buf_set_lines(buf, 0, -1, false, logo)

        local ns = api.nvim_create_namespace("yuridash")
        
        for i = 0, 5 do
            api.nvim_buf_add_highlight(buf, ns, "YuriDashHeader", pad_top + i, 0, -1)
        end
        
        api.nvim_buf_add_highlight(buf, ns, "YuriDashSub", pad_top + 7, 0, -1)

        local e_line = pad_top + 10
        local w_line = pad_top + 11
        local q_line = pad_top + 12

        api.nvim_buf_add_highlight(buf, ns, "YuriDashKey", e_line, #pad_left + 4, #pad_left + 9)
        api.nvim_buf_add_highlight(buf, ns, "YuriDashText", e_line, #pad_left + 9, -1)

        api.nvim_buf_add_highlight(buf, ns, "YuriDashKey", w_line, #pad_left + 4, #pad_left + 9)
        api.nvim_buf_add_highlight(buf, ns, "YuriDashText", w_line, #pad_left + 9, -1)

        api.nvim_buf_add_highlight(buf, ns, "YuriDashKey", q_line, #pad_left + 4, #pad_left + 9)
        api.nvim_buf_add_highlight(buf, ns, "YuriDashText", q_line, #pad_left + 9, -1)

        vim.bo[buf].modifiable = false

        local opts = { buffer = buf, silent = true }
        vim.keymap.set("n", "e", "<cmd>Lexplore<CR>", opts)
        vim.keymap.set("n", "w", "<cmd>enew<CR>", opts)
        vim.keymap.set("n", "q", "<cmd>q<CR>", opts)
    end,
})
