-- Neovim configuration entry point. Loaded first on startup.

-- Must be disabled before any plugin loads so neo-tree can own file browsing.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Must be set before lazy.nvim loads so plugins see the correct leader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

-- vim: ts=2 sts=2 sw=2 et
