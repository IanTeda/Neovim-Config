-- [[ File: ~/.configs/nvim/init.lua ]]
-- Entry point for Neovim config

-- [[ Imports ]]
-- Neovim will look in the ./lua folder so we don't need to scope it with the lua folder prefix
require('keymaps')
require('options')
require('lazyload')


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
