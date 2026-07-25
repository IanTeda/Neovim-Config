-- https://neovim.io/doc/user/options.html

local opt = vim.opt

-- [[ Appearance ]]
opt.colorcolumn = "80"
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false
opt.conceallevel = 0       -- show `` in markdown files
opt.guifont = "monospace:h17"
vim.g.background = "dark"

-- [[ Behaviour ]]
opt.backup = false
opt.swapfile = false
opt.undofile = true        -- persistent undo across sessions
opt.writebackup = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.timeoutlen = 1000
opt.updatetime = 300
opt.completeopt = { "menuone", "noselect" }
opt.pumheight = 10
opt.cmdheight = 2

-- [[ Splits ]]
opt.splitright = true
opt.splitbelow = true

-- [[ Search ]]
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- [[ Indentation ]]
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smartindent = true
opt.showmode = false
opt.showtabline = 4

-- [[ Scrolling ]]
opt.scrolloff = 8
opt.sidescrolloff = 8

-- [[ Spell ]]
opt.spell = true
opt.spelllang = "en_au"

-- [[ Encoding ]]
opt.encoding = "utf8"
opt.fileencoding = "utf8"

-- vim: ts=2 sts=2 sw=2 et
