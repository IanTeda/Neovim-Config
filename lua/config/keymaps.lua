-- https://neovim.io/doc/user/quickref.html

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Unmap space so leader doesn't move the cursor
map("", "<Space>", "<Nop>", opts)

-- [[ Normal Mode ]]

-- Navigate splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
map("n", "<C-Up>",    ":resize +2<CR>",          opts)
map("n", "<C-Down>",  ":resize -2<CR>",           opts)
map("n", "<C-Left>",  ":vertical resize -2<CR>",  opts)
map("n", "<C-Right>", ":vertical resize +2<CR>",  opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>",     opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

-- Clear search highlight
map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Open file explorer
map("n", "<leader>e", ":Oil<CR>", opts)

-- Insert blank lines without entering insert mode
map("n", "<leader>o", "m`o<Esc>``", opts)
map("n", "<leader>O", "m`O<Esc>``", opts)

-- [[ Insert Mode ]]

-- Quick exit to normal mode
map("i", "jk", "<ESC>", opts)

-- [[ Visual Mode ]]

-- Stay in indent mode after indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move selected lines up/down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)

-- Paste without clobbering the yank register
map("v", "p", '"_dP', opts)

-- [[ Visual Block Mode ]]

-- Move text blocks
map("x", "J",     ":move '>+1<CR>gv-gv", opts)
map("x", "K",     ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- vim: ts=2 sts=2 sw=2 et
