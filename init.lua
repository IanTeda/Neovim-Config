-------------------------------------------------------------------------------
-- NEOVIM CONFIG INIT
-- Entry point for Neovim config
-- File: ~/.configs/nvim/init.lua
-- ----------------------------------------------------------------------------

-- Disable Netrw for better Neotree intergration
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- [[ Imports ]]
-- Neovim will look in the ./lua folder so we don't need to scope it with the 
-- lua folder prefix
require("variables")
require('keymaps')
require('options')
require('lazyload')


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
