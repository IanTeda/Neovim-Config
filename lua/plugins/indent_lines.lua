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
    
    main = "ibl",

    -- KEY MAPPING
    -- Key mappings will load the plugin the first time they get executed.
    -- keys = {"<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree"} ,

    -- DEPENDENCIES
    -- A list of plugin names or plugin specs that should be loaded when the 
    -- plugin loads. Dependencies are always lazy-loaded unless specified 
    -- otherwise. When specifying a name, make sure the plugin spec has been
    -- defined somewhere else.
    -- dependencies = { 'github_username/repo_name'},

    -- COMMAND
    -- Lazy load on command 
    -- cmd = {},

    -- FILETYPE
    -- Lazy load on filetype
    -- ft = {},

    -- PRIORITY
    -- Only useful for start plugins (lazy=false) to force loading certain 
    -- plugins first. Default priority is 50. It’s recommended to set this to 
    -- a high number for colorschemes.
    -- priority = number?,

    -- OPTIONAL
    -- When a spec is tagged optional, it will only be included in the 
    -- final spec, when the same plugin has been specified at least once 
    -- somewhere else without optional. This is mainly useful for Neovim 
    -- distros, to allow setting options on plugins that may/may not be part 
    -- of the user’s plugins
    -- optional = boolean?,

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
    --    }
    --    require('plugin').setup(PLUGIN_SETTINGS)
    --end,
}
