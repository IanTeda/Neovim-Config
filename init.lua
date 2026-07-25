-- Disable netrw early so neo-tree can take over file browsing
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Leader must be set before lazy.nvim loads plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

-- vim: ts=2 sts=2 sw=2 et
