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

-- Enter file explore with leader key [Disable once nvim-tree installed]
keymap("n", "<leader>e", ":Lex 30<cr>", opts) 				-- <leader+e> = open nwtree file explorer

-- Open Nvim Tree with leader(space)+e
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)		-- <leader+e> = open nvim-tree file explorer

-- Resize split screens/windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)				-- <ctrl+up> = resize split screen up
keymap("n", "<C-Down>", ":resize -2<CR>", opts)				-- <ctrl+down> = resize split screen down
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)		-- <ctrl+left> = resize split screen left
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)		-- <ctrl+right> = resoze split screen right

-- Navigate buffers (not windows)
keymap("n", "<S-l>", ":bnext<CR>", opts)				-- <shift+l> = switch buffer focus left
keymap("n", "<S-h>", ":bprevious<CR>", opts)				-- <shift+r> = switch buffer focus right

-- Toggle line comments on and off
keymap("n", "<leader>/", "<cmd>lua require('Comment').toggle()<CR>", opts)

-- Open fuzzy finder with leader(space)+f
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts) -- Old way o:withf doing it
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

-- Open live Grep through text
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)		-- <ctrl+t> = open Telescope text search

-- Restart neovim config without exiting
keymap("n", "<Leader>r", ":source $MYVIMRC<CR>", opts)


-- [[ Insert Mode ]]
-- ============================================================================

-- Press jk for fast exit of instert mode
keymap("i", "jk", "<ESC>", opts)					-- <jk> = quick exit from insert mode
-- remap the key used to leave insert mode
-- keymap('i', 'jk', '', {})


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

-- Toggle line comment on and off
keymap("v", "<leader>/", ":lua require(\"Comment.api\").gc(vim.fn.visualmode())<cr>", opts)


-- [[ Visual Block Mode ]]
-- ============================================================================

-- Move text line block
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)				-- <J> = move text block up
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)				-- <K> = move text block down

-- Move text block up and down with alt+{j,k}
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- [[ Terminal Mode ]]
-- ============================================================================

-- Managed in toggleterm plugin
-- Navigate between terminals
--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)			  -- <ctrl+h> = move left between terminals
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)			  -- <ctrl+j> = move down between terminals
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)			  -- <ctrl+k> = move up between terminals
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)			  -- <ctrl+l> = move right between terminal


