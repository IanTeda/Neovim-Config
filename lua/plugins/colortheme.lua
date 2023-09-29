-----------------------------------------------------------------------------------------------------------------------
-- COLOR SCHEME
-- Install and persist color theme across loads
-----------------------------------------------------------------------------------------------------------------------

-- File: ~/.config/nvim/lua/colortheme.lua
-- Repo: https://vimcolorschemes.com/

return
{
	"rebelot/kanagawa.nvim",
	lazy = false, -- set false to load during start up since it is our main colorscheme
	priority = 1000, -- set priority to make sure it loads before all the other plugins
	config = function()
		-- Persist the colorscheme
		vim.cmd([[colorscheme kanagawa]])
	end,
}
