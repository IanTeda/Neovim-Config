--[[ File: ~/.config/nvim/lua/opts.lua ]]
-- https://neovim.io/doc/user/options.html

-- Shorten function names for readability
local opt = vim.opt


-- [[ Context ]]
opt.colorcolumn = '120'                          -- str:  Show col for max line length
opt.number = true                               -- bool: Show line numbers
opt.relativenumber = false                      -- bool: Show relative line numbers
opt.scrolloff = 4                               -- int:  Min num lines of context
opt.signcolumn = "yes"                          -- str:  Show the sign column
opt.termguicolors = true                        -- bool: Set termguicolors to enable highlight groups in nvim-tree
opt.backup = false                              -- bool: Creates a backup file
opt.clipboard = "unnamedplus"                   -- allows neovim to access the system clipboard
opt.cmdheight = 2                               -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" }     -- mostly just for cmp
opt.mouse = "a"                                 -- allow the mouse to be used in neovim
opt.pumheight = 10                              -- pop up menu height
opt.swapfile = false                            -- creates a swapfile
opt.timeoutlen = 1000                           -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                             -- enable persistent undo
opt.updatetime = 300                            -- faster completion (4000ms default)
opt.writebackup = false                         -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.cursorline = true                           -- highlight the current line
opt.numberwidth = 4                             -- set number column width to 2 {default 4}
-- vim.opt.shortmess:append "c"
opt.wrap = false                                -- bool: Lines longer than the width of the window will wrap and displaying continues on the next line


-- [[ Filetypes ]]
opt.encoding = 'utf8'                           -- str:  String encoding to use
opt.fileencoding = 'utf8'                       -- str:  File encoding to use


-- [[ Search ]]
opt.ignorecase = true                           -- bool: Ignore case in search patterns
opt.smartcase = true                            -- bool: Override ignorecase if search contains capitals
opt.incsearch = true                            -- bool: Use incremental search
opt.hlsearch = true                             -- bool: Highlight search matches


-- [[ Whitespace ]]
opt.expandtab = true                            -- bool: Use spaces instead of tabs
opt.shiftwidth = 4                              -- num:  Size of an indent
opt.softtabstop = 4                             -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                                 -- num:  Number of spaces tabs count for
opt.showmode = false                            -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 4                             -- always show tabs
opt.smartcase = true                            -- smart case
opt.smartindent = true                          -- make indenting smarter again
opt.scrolloff = 8                               -- is one of my fav
opt.sidescrolloff = 8


-- [[ Splits ]]
opt.splitright = true                           -- bool: Place new window to right of current one
opt.splitbelow = true                           -- bool: Place new window below the current one


-- [[ Theme ]]
opt.syntax = "ON"                               -- str:  Allow syntax highlighting
opt.termguicolors = true                        -- bool: If term supports ui color then enable
opt.conceallevel = 0                            -- so that `` is visible in markdown files
opt.guifont = "monospace:h17"                   -- the font used in graphical neovim applications

