local opt = vim.opt
local api = vim.api

opt.termguicolors = true

api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local hl_groups = {
            "Normal", "NormalNC", "NormalFloat", "FloatBorder",
            "CursorLine", "SignColumn", "StatusLine", "StatusLineNC",
            "WinSeparator", "VertSplit", "Pmenu", "TabLine", "TabLineFill"
        }
        for _, name in ipairs(hl_groups) do
            vim.cmd(string.format("hi %s guibg=NONE ctermbg=NONE", name))
        end

        vim.cmd("hi WinSeparator guibg=NONE guifg=#5c5c5c")

        vim.cmd("hi YuriModeInsert guibg=NONE guifg=#ffb3ba gui=bold")
        vim.cmd("hi YuriModeNormal guibg=NONE guifg=#baffc9 gui=bold")
        vim.cmd("hi YuriModeVisual guibg=NONE guifg=#ffdfba gui=bold")
        vim.cmd("hi YuriFile       guibg=NONE guifg=#bae1ff gui=bold")
        vim.cmd("hi YuriInfo       guibg=NONE guifg=#e8aeff")

        vim.cmd("hi TabLine        guibg=NONE guifg=#5c5c5c gui=none")
        vim.cmd("hi TabLineSel     guibg=NONE guifg=#bae1ff gui=bold")
        vim.cmd("hi TabLineFill    guibg=NONE guifg=NONE")
        vim.cmd("hi YuriTabActive  guibg=NONE guifg=#bae1ff gui=bold")
        vim.cmd("hi YuriTabInact   guibg=NONE guifg=#5c5c5c gui=none")
        vim.cmd("hi YuriTabDot     guibg=NONE guifg=#baffc9 gui=bold")
        vim.cmd("hi YuriTabSep     guibg=NONE guifg=#3a3a3a gui=none")
    end,
})

vim.cmd("colorscheme default")

opt.number         = true
opt.relativenumber = true
opt.signcolumn     = "yes"
opt.cursorline     = true
opt.wrap           = false
opt.updatetime     = 250
opt.scrolloff      = 8
opt.sidescrolloff  = 8

opt.tabstop     = 4
opt.shiftwidth  = 4
opt.expandtab   = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase  = true
opt.hlsearch   = true

opt.clipboard  = "unnamedplus"

opt.showtabline = 1

opt.splitright = true
opt.splitbelow = true

opt.path:append("**")
opt.wildmenu = true
opt.wildmode = "longest:full,full"

vim.g.netrw_keepdir   = 0
vim.g.netrw_winsize   = 25
vim.g.netrw_banner    = 0
vim.g.netrw_liststyle = 3

_G.yuri_tabline = function()
    local result = " "
    local current = vim.fn.tabpagenr()
    local total   = vim.fn.tabpagenr("$")

    for i = 1, total do
        local buflist = vim.fn.tabpagebuflist(i)
        local winnr   = vim.fn.tabpagewinnr(i)
        local bufnr   = buflist[winnr]
        local name    = vim.fn.bufname(bufnr)
        local short   = name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]"
        local modified = vim.fn.getbufvar(bufnr, "&modified") == 1 and "  " or " "

        if i == current then
            result = result .. "%#YuriTabDot# · %#YuriTabActive#" .. short .. modified
        else
            result = result .. "%#YuriTabInact#  " .. short .. modified
        end

        if i < total then
            result = result .. "%#YuriTabSep#│"
        end
    end

    result = result .. "%#TabLineFill#"
    return result
end

opt.tabline = "%!v:lua.yuri_tabline()"

local mode_map = {
    ['n']   = {':3 NORMAL',  'YuriModeNormal'},
    ['i']   = {'󰏫 INSERT',   'YuriModeInsert'},
    ['R']   = {'󰛔 REPLACE',  'YuriModeInsert'},
    ['v']   = {'󰈈 VISUAL',   'YuriModeVisual'},
    ['V']   = {'󰈈 V-LINE',   'YuriModeVisual'},
    ['\22'] = {'󰈈 V-BLOCK',  'YuriModeVisual'},
    ['c']   = {' COMMAND',  'YuriInfo'},
    ['t']   = {' TERMINAL', 'YuriInfo'},
}

_G.yuri_statusline = function()
    local mode_data  = mode_map[api.nvim_get_mode().mode] or {':3 NORMAL', 'YuriModeNormal'}
    local mode_str   = mode_data[1]
    local mode_hl    = mode_data[2]
    local location   = " %l:%c"
    local percentage = "󰮱 %p%%"
    local time_str   = "󱑒 " .. os.date("%H:%M")
    return string.format(
        " %%#%s#%s %%#WinSeparator#│ %%#YuriFile#󰈚 %s%s%s %%= %%#YuriInfo#%s │ %s │ %s ",
        mode_hl, mode_str, "%f", "%m", "%r", location, percentage, time_str
    )
end

opt.statusline = "%!v:lua.yuri_statusline()"
