-- [[ File: ~/.config/nvim/lua/colortheme.lua ]]
-- Persist color theme across loads

return {
    "folke/tokyonight.nvim",
    lazy = false, -- set false to load during start up since it is our main colorscheme
    priority = 1000, -- set priority to make sure it loads before all the other plugins
    config = function()
        -- Persist the colorscheme
        vim.cmd([[colorscheme tokyonight]])
    end,
}
