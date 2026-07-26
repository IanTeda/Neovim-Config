-- https://neovim.io/doc/user/options.html

local opt = vim.opt

-- [[ Appearance ]]
opt.colorcolumn = "80"         -- highlight column 80 as a line-length guide
opt.cursorline = true          -- highlight the line the cursor is on
opt.number = true              -- show absolute line numbers
opt.relativenumber = true      -- show relative line numbers for easier motion jumps
opt.signcolumn = "yes"         -- always reserve space for the sign column to prevent layout shifts
opt.termguicolors = true       -- enable 24-bit RGB colour in the terminal
opt.wrap = true               -- disable soft line wrapping
opt.conceallevel = 0           -- show `` in markdown files
opt.guifont = "monospace:h17"  -- font used by GUI clients (e.g. Neovide)
opt.showmode = false           -- don't show -- INSERT -- etc.; the statusline handles this
vim.g.background = "dark"      -- hint colourschemes to use their dark variant

-- [[ Behaviour ]]
opt.backup = false                          -- don't create backup files before overwriting
opt.swapfile = false                        -- don't create swap files
opt.undofile = true                         -- persistent undo across sessions
opt.writebackup = false                     -- don't keep a temporary backup while writing a file
opt.mouse = "a"                             -- enable mouse support in all modes
opt.clipboard = "unnamedplus"               -- sync yank/paste with the system clipboard
opt.timeoutlen = 1000                       -- ms to wait for a mapped key sequence to complete
opt.updatetime = 300                        -- ms of inactivity before writing the swap file and firing CursorHold
opt.completeopt = { "menuone", "noselect" } -- show completion menu for a single match; don't auto-select
opt.pumheight = 10                          -- max number of items shown in the completion popup
opt.cmdheight = 2                           -- extra lines for the command-line area

-- [[ Splits ]]
opt.splitright = true  -- vertical splits open to the right
opt.splitbelow = true  -- horizontal splits open below

-- [[ Search ]]
opt.ignorecase = true  -- case-insensitive search by default
opt.smartcase = true   -- switch to case-sensitive when the pattern contains uppercase
opt.incsearch = true   -- show matches incrementally as the search pattern is typed
opt.hlsearch = true    -- highlight all matches after a search

-- [[ Indentation ]]
opt.expandtab = true    -- insert spaces when Tab is pressed
opt.shiftwidth = 4      -- spaces used per indent level
opt.softtabstop = 4     -- spaces inserted/removed when pressing Tab/Backspace
opt.tabstop = 4         -- visual width of a literal Tab character
opt.smartindent = true  -- auto-indent new lines based on surrounding syntax
opt.showtabline = 2     -- always show the tab line

-- [[ Scrolling ]]
opt.scrolloff = 8      -- keep at least 8 lines visible above and below the cursor
opt.sidescrolloff = 8  -- keep at least 8 columns visible to the left and right of the cursor

-- [[ Spell ]]
opt.spell = true          -- enable spell checking
opt.spelllang = "en_au"   -- Australian English dictionary

-- [[ Encoding ]]
opt.encoding = "utf8"      -- Neovim's internal character encoding
opt.fileencoding = "utf8"  -- encoding used when reading and writing files

-- vim: ts=2 sts=2 sw=2 et
