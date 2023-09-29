-------------------------------------------------------------------------------
-- MINI COMMENTS
-- Comment plugin 
--
-- File: ~/.config/nvim/lua/plugins/mini_comment.lua
-- Repo: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-comment.md
-------------------------------------------------------------------------------

return {
    -- PLUGIN TO LAZY LOAD
    -- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
    'echasnovski/mini.comment',
    
    -- VERSIONING
    -- If you want to install a specific revision of a plugin, you can use 
    -- `commit`,`tag`, `branch`, `version`.
    version = "*",
    
    -- KEY MAPPING
    -- Key mappings will load the plugin the first time they get executed.
    -- keys = {"<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree"} ,

    -- SETTINGS
    -- opts should be a table (will be merged with parent specs), return a 
    -- table (replaces parent specs) or should change a table. The table will 
    -- be passed to the Plugin.config() function. Setting this value will imply
    -- Plugin.config()
    opts = {
        -- Options which control module behavior
        options = {
            -- Function to compute custom 'commentstring' (optional)
            custom_commentstring = nil,

            -- Whether to ignore blank lines
            ignore_blank_line = false,

            -- Whether to recognize as comment only lines without indent
            start_of_line = false,

            -- Whether to ensure single space pad for comment parts
            pad_comment_parts = true,
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Toggle comment (like `gcip` - comment inner paragraph) for both
            -- Normal and Visual modes
            comment = 'gc',

            -- Toggle comment on current line
            comment_line = 'gcc',

            -- Define 'comment' textobject (like `dgc` - delete whole comment block)
            textobject = 'gc',
        },

        -- Hook functions to be executed at certain stage of commenting
        hooks = {
            -- Before successful commenting. Does nothing by default.
            pre = function() end,
            -- After successful commenting. Does nothing by default.
            post = function() end,
        },
    }
}
