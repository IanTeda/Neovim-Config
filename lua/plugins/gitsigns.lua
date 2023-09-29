-------------------------------------------------------------------------------
-- gitsigns.nvim
--  Super fast git decorations implemented purely in Lua.
--
-- File: ~/.config/nvim/lua/plugins/gitsigns.lua
-- Repo: https://github.com/lewis6991/gitsigns.nvim
-------------------------------------------------------------------------------

return {
    -- PLUGIN TO LAZY LOAD
    -- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
    'lewis6991/gitsigns.nvim',
    
    -- VERSIONING
    -- If you want to install a specific revision of a plugin, you can use 
    -- `commit`,`tag`, `branch`, `version`.
    version = "*",
    
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
    -- opts = {}

    -- CONFIG 
    -- Config is executed when the plugin loads. The default implementation 
    -- will automatically run require(MAIN).setup(opts). Lazy uses several
    -- heuristics to determine the plugin’s MAIN module automatically based 
    -- on the plugin’s name. See also opts. To use the default implementation 
    -- without opts set config to true.
    config = function ()
       ---@class PLUGIN_SETTINGS
       local PLUGIN_SETTINGS = {
            signs = {
                add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
                delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter_opts = {
                relative_time = false,
            },
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            yadm = {
                enable = false,
            },
        }
        require('gitsigns').setup(PLUGIN_SETTINGS)
    end,
}
