local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "<leader>e", vim.cmd.Lexplore)
keymap.set("n", "<leader>w", "<cmd>w<CR>")
keymap.set("n", "<leader>q", "<cmd>q<CR>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>sx", "<cmd>close<CR>")
