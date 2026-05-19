local opt = vim.opt
local api = vim.api

opt.termguicolors = true

api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local hl_groups = {
            "Normal", "NormalNC", "NormalFloat", "FloatBorder", 
            "CursorLine", "SignColumn", "StatusLine", "StatusLineNC",
            "WinSeparator", "VertSplit", "Pmenu"
        }
        for _, name in ipairs(hl_groups) do
            vim.cmd(string.format("hi %s guibg=NONE ctermbg=NONE", name))
        end
        vim.cmd("hi WinSeparator guibg=NONE guifg=#5c5c5c") 
        
        vim.cmd("hi YuriModeInsert guibg=NONE guifg=#ffb3ba gui=bold")
        vim.cmd("hi YuriModeNormal guibg=NONE guifg=#baffc9 gui=bold")
        vim.cmd("hi YuriModeVisual guibg=NONE guifg=#ffdfba gui=bold")
        vim.cmd("hi YuriFile guibg=NONE guifg=#bae1ff gui=bold")
        vim.cmd("hi YuriInfo guibg=NONE guifg=#e8aeff")
    end,
})
vim.cmd("colorscheme default")

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.splitright = true
opt.splitbelow = true

opt.path:append("**")
opt.wildmenu = true
opt.wildmode = "longest:full,full"

vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

local mode_map = {
    ['n']      = {':3 NORMAL', 'YuriModeNormal'},
    ['i']      = {'󰏫 INSERT', 'YuriModeInsert'},
    ['R']      = {'󰛔 REPLACE', 'YuriModeInsert'},
    ['v']      = {'󰈈 VISUAL',  'YuriModeVisual'},
    ['V']      = {'󰈈 V-LINE',  'YuriModeVisual'},
    ['\22']    = {'󰈈 V-BLOCK', 'YuriModeVisual'},
    ['c']      = {' COMMAND', 'YuriInfo'},
    ['t']      = {' TERMINAL', 'YuriInfo'},
}

_G.yuri_statusline = function()
    local mode_data = mode_map[api.nvim_get_mode().mode] or {':3 NORMAL', 'YuriModeNormal'}
    local mode_str = mode_data[1]
    local mode_hl = mode_data[2]

    local file_name = "%f"
    local modified = "%m"
    local readonly = "%r"
    
    local location = " %l:%c"
    local percentage = "󰮱 %p%%"
    local time_str = "󱑒 " .. os.date("%H:%M")

    return string.format(
        " %%#%s#%s %%#WinSeparator#│ %%#YuriFile#󰈚 %s%s%s %%= %%#YuriInfo#%s │ %s │ %s ",
        mode_hl, mode_str, file_name, modified, readonly, location, percentage, time_str
    )
end

opt.statusline = "%!v:lua.yuri_statusline()"
