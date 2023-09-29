--[[ File: ~/.config/nvim/lua/keymaps.lua ]]
-- https://neovim.io/doc/user/quickref.html


-- Shorten Function Names for Readability
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }


-- [[ Leader Keys ]]
-- ============================================================================
-- Remap space as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- [[ Modes ]]
--  ===========================================================================
--  "n" = Normal Mode
--  "i" = Insert Mode
--  "v" = Visual Mode
--  "x" = Visual Block Mode
--  "t" = Term Mode
--  "c" = Command Mode


-- [[ Normal View Mode]]
-- ============================================================================

-- Navigate between split screens/windows with ctrl+{h,j,k,l}
keymap("n", "<C-h>", "<C-w>h", opts) 					-- <ctrl+h> = navigate split screen left
keymap("n", "<C-j>", "<C-w>j", opts)					-- <ctrl+j> = navigate split screen down
keymap("n", "<C-k>", "<C-w>k", opts)					-- <ctrl+k> = navigate split screen up
keymap("n", "<C-l>", "<C-w>l", opts)					-- <ctrl+l> = navigate split screen right

-- Resize split screens/windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)				-- <ctrl+up> = resize split screen up
keymap("n", "<C-Down>", ":resize -2<CR>", opts)				-- <ctrl+down> = resize split screen down
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)		-- <ctrl+left> = resize split screen left
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)		-- <ctrl+right> = resoze split screen right

-- Navigate buffers (not windows)
keymap("n", "<S-l>", ":bnext<CR>", opts)				-- <shift+l> = switch buffer focus left
keymap("n", "<S-h>", ":bprevious<CR>", opts)				-- <shift+r> = switch buffer focus right

-- [[ Insert Mode ]]
-- ============================================================================

-- Press jk for fast exit of instert mode
keymap("i", "jk", "<ESC>", opts)					-- <jk> = quick exit from insert mode


-- [[ Visual Mode ]]
-- ============================================================================

-- Stay in indent mode when pressing
keymap("v", "<", "<gv", opts)						-- <<> = indent left and stay in indent mode
keymap("v", ">", ">gv", opts)						-- <>> = indent right and stay in indent mode

-- Move line up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)				-- <alt+j> = move highlighted text down
keymap("v", "<A-k>", ":m .-2<CR>==", opts)				-- <alt+k> = move highlighted text up

-- Keep paste buffer after paste for next one
keymap("v", "p", '"_dP', opts)						-- <p> = keep paste buffer after paste for next paste


-- [[ Visual Block Mode ]]
-- ============================================================================

-- Move text line block
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)				-- <J> = move text block up
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)				-- <K> = move text block down

-- Move text block up and down with alt+{j,k}
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

