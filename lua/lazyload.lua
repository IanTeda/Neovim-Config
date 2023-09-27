-- [[ File: ~/.config/nvim/lua/lazy.lua ]]
-- https://github.com/folke/lazy.nvim#-installation
-- Set up Lazy.nvim plugin manager
-- ':help lazy.nvim.txt` for more info
-- ============================================================================

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Lazy.nvim will plugin spec files should go in ~/.config/nvim/lua/plugins
-- Plugin spec files will be merged together in the final spec, so it is not needed to add require calls in your plugin
-- spec files.
-- You can also configure plugins after the setup call, as they will be available in your neovim runtime.
require('lazy').setup("plugins")

