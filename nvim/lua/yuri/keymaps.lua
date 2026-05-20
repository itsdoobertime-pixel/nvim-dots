local keymap = vim.keymap
vim.g.mapleader = " "

keymap.set("n", "<leader>e", function()
    local current_win_id = vim.api.nvim_get_current_win()
    vim.cmd("Lexplore")
    local shifted_winnr = vim.fn.win_id2win(current_win_id)
    if shifted_winnr > 0 then
        vim.g.netrw_chgwin = shifted_winnr
    end
end)

keymap.set("n", "<leader>w",  "<cmd>w<CR>")
keymap.set("n", "<leader>q",  "<cmd>qa<CR>")
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
keymap.set("n", "<leader>to", "<cmd>tabonly<CR>")
keymap.set("n", "<leader>te", "<cmd>tabnew | Lexplore<CR>")

keymap.set("n", "<Tab>",      "<cmd>tabnext<CR>")
keymap.set("n", "<S-Tab>",    "<cmd>tabprev<CR>")
keymap.set("n", "<leader>1",  "<cmd>tabn 1<CR>")
keymap.set("n", "<leader>2",  "<cmd>tabn 2<CR>")
keymap.set("n", "<leader>3",  "<cmd>tabn 3<CR>")
keymap.set("n", "<leader>4",  "<cmd>tabn 4<CR>")
keymap.set("n", "<leader>5",  "<cmd>tabn 5<CR>")

keymap.set("n", "<leader>tmp", "<cmd>tabmove +1<CR>")
keymap.set("n", "<leader>tmn", "<cmd>tabmove -1<CR>")

keymap.set("n", "<leader>bd", "<cmd>bd<CR>")

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")

keymap.set("n", "<leader>a",  "ggVG")                          
keymap.set("n", "<leader>y",  '"+y')  
keymap.set("v", "<leader>y",  '"+y')
keymap.set("n", "J",          "mzJ`z")
keymap.set("n", "<C-d>",      "<C-d>zz")
keymap.set("n", "<C-u>",      "<C-u>zz")
keymap.set("n", "n",          "nzzzv")
keymap.set("n", "N",          "Nzzzv")
keymap.set("v", "<",          "<gv")             
keymap.set("v", ">",          ">gv")
keymap.set("v", "<A-j>",      ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>",      ":m '<-2<CR>gv=gv")
keymap.set("n", "<leader>rw", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>")

keymap.set("n", "<leader>tt", "<cmd>tabnew | terminal<CR>")
keymap.set("n", "<leader>tv", "<cmd>vsplit | terminal<CR>")
keymap.set("n", "<leader>th", "<cmd>split | terminal<CR>")

keymap.set("t", "<Esc>", [[<C-\><C-n>]])
keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])
keymap.set("t", "<Tab>", [[<C-\><C-n><cmd>tabnext<CR>]])
keymap.set("t", "<S-Tab>", [[<C-\><C-n><cmd>tabprev<CR>]])

keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>")
keymap.set("n", "<leader>sh", "<cmd>split<CR>")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", "<cmd>close<CR>")
keymap.set("n", "<leader>sm", "", {
    callback = function()
        if vim.g.window_maximized then
            vim.cmd("wincmd =")
            vim.g.window_maximized = false
        else
            vim.cmd("wincmd |")
            vim.cmd("wincmd _")
            vim.g.window_maximized = true
        end
    end
})
