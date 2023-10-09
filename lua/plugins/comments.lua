-------------------------------------------------------------------------------
-- TOGGLE COMMENTS
-- Smart and Powerful commenting plugin
--
-- File: ~/.config/nvim/lua/plugins/comments.lua
-- Repo: https://github.com/numToStr/Comment.nvim
-- -----------------------------------------------------------------------------

return {
    -- PLUGIN TO LAZY LOAD
    -- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
    'numToStr/Comment.nvim',

    -- VERSIONING
    -- If you want to install a specific revision of a plugin, you can use
    -- `commit`,`tag`, `branch`, `version`.
    -- version = "*",

    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },

    lazy = false,

    -- CONFIG
    -- Config is executed when the plugin loads. The default implementation
    -- will automatically run require(MAIN).setup(opts). Lazy uses several
    -- heuristics to determine the plugin’s MAIN module automatically based
    -- on the plugin’s name. See also opts. To use the default implementation
    -- without opts set config to true.
    config = function()
        -- Put plugin settings into a local variable for easier reading
        local PLUGIN_SETTINGS = {
            -- Add options here
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = true,
            ---Lines to be ignored while (un)comment
            ignore = nil,
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = 'gcc',
                ---Block-comment toggle keymap
                block = 'gbc',
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = 'gc',
                ---Block-comment keymap
                block = 'gb',
            },
            ---LHS of extra mappings
            extra = {
                ---Add comment on the line above
                above = 'gcO',
                ---Add comment on the line below
                below = 'gco',
                ---Add comment at the end of line
                eol = 'gcA',
            },
            ---Enable keybindings
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = true,
            },
            ---Function to call before (un)comment
            pre_hook = nil,
            ---Function to call after (un)comment
            post_hook = nil,
        }
        require('Comment').setup(PLUGIN_SETTINGS)

        -- Configure custom comment strings
        local ft = require('Comment.ft')
        -- Configure comment string for Beancount files
        ft.beancount = {
            -- Line comment string
            ';%s',
            -- Block comment string
            -- ';[[%s]]' -- There is no Beancount block comment string
        }
    end,
}
