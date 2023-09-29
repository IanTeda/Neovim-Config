-------------------------------------------------------------------------------
-- NEOVIM VARIABLES
-- Vim variables
-- Files: ~/.config/nvim/lua/variables.lua
--
-- buffer-variable    b:    Local to the current buffer.
-- window-variable    w:    Local to the current window.
-- tabpage-variable   t:    Local to the current tab page.
-- global-variable    g:    Global.
-- local-variable     l:    Local to a function.
-- script-variable    s:    Local to a |:source|'ed Vim script.
-- function-argument  a:    Function argument (only inside a function).
-- vim-variable       v:    Global, predefined by Vim.
-------------------------------------------------------------------------------

local g = vim.g
g.t_co = 256
g.background = "dark"

-- Neovime provder Variables
g.node_host_prog = "/usr/local/bin/neovim-node-host"
g.python3_host_prog = "/usr/bin/python3"
g.ruby_host_prog = "/usr/local/bin/neovim-ruby-host"
g.perl_host_prog = "/usr/bin/perl"
