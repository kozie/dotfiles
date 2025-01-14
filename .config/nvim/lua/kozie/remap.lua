vim.g.mapleader = " "

-- Open Explorer.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected up or down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Stay on position when joining lines.
vim.keymap.set("n", "J", "mzJ`z")

-- Scrolling & keep centered.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste into the void (keeps register).
vim.keymap.set("x", "<leader>p", "\"_dP")

-- OS Clipboard yanking.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Deleting does not overwrite yank register.
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Quicklist navigation bindings.
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Exit insert with jk
vim.keymap.set("i", "jk", "<ESC>")

-- Split panes!
vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>")

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Move in insert mode.
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- End line with delimiter (;)
vim.keymap.set("i", "<C-d>", "<Esc>ea;", { noremap = true, silent = true})
vim.keymap.set("i", "<C-;>", "<Esc>g;a;<Esc>", { noremap = true, silent = true})
vim.keymap.set("i", "<C-,>", "<Esc>A,<Esc>o", { noremap = true, silent = true})

vim.keymap.set("n", "<C-;>", "<Esc>A;<Esc>o", { noremap = true, silent = true})
vim.keymap.set("n", "<C-,>", "<Esc>A,<Esc>o", { noremap = true, silent = true})
