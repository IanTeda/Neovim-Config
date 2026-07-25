-- https://lazy.folke.io/

-- Bootstrap lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
  },
  install = {
    -- Fallback colorscheme while plugins install
    colorscheme = { "habamax" },
  },
  git = {
    timeout = 120,
    log = { "--since=3 days ago" },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
  },
  checker = {
    enabled = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      reset = true,
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
