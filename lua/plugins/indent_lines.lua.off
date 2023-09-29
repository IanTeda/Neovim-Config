-------------------------------------------------------------------------------
-- INDENT BLANKLINES
-- Indentation guides to Neovim. It uses Neovim's virtual text feature and no 
-- conceal 
--
-- File: ~/.config/nvim/lua/plugins/indent_lines.lua
-- Repo: https://github.com/lukas-reineke/indent-blankline.nvim
-------------------------------------------------------------------------------

return {
    -- PLUGIN TO LAZY LOAD
    -- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
    "lukas-reineke/indent-blankline.nvim",
    
    -- VERSIONING
    -- If you want to install a specific revision of a plugin, you can use 
    -- `commit`,`tag`, `branch`, `version`.
    version = "*",

    -- Main Module
    --You can specify the main module to use for config() and opts(), in case 
    -- it can not be determined automatically. See config() 
    main = "ibl",

    -- SETTINGS
    -- opts should be a table (will be merged with parent specs), return a 
    -- table (replaces parent specs) or should change a table. The table will 
    -- be passed to the Plugin.config() function. Setting this value will imply
    -- Plugin.config()
    opts = {
        char = '┊',
        show_trailing_blankline_indent = false,
    }

    -- CONFIG 
    -- Config is executed when the plugin loads. The default implementation 
    -- will automatically run require(MAIN).setup(opts). Lazy uses several
    -- heuristics to determine the plugin’s MAIN module automatically based 
    -- on the plugin’s name. See also opts. To use the default implementation 
    -- without opts set config to true.
    -- config = function ()
    --     ---@class PLUGIN_SETTINGS
    --     local PLUGIN_SETTINGS = {
    --     p
    --    }
    --    require('plugin').setup(PLUGIN_SETTINGS)
    --end,
}
