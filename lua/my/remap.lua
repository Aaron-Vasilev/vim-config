vim.g.mapleader = " "

--Ex
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

--down half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--geatest remap ever
vim.keymap.set("x", "<leader>p", "p")
vim.keymap.set("x", "p", "\"_dP")

--highlight without jump to next word
vim.keymap.set("n", "*", "*``")
