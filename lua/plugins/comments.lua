return {
    -- PLUGIN TO LAZY LOAD
    -- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
    'numToStr/Comment.nvim',
    
    -- VERSIONING
    -- If you want to install a specific revision of a plugin, you can use 
    -- `commit`,`tag`, `branch`, `version`.
    version = "*",
    
    -- CONFIG 
    -- Config is executed when the plugin loads. The default implementation 
    -- will automatically run require(MAIN).setup(opts). Lazy uses several
    -- heuristics to determine the plugin’s MAIN module automatically based 
    -- on the plugin’s name. See also opts. To use the default implementation 
    -- without opts set config to true.
    config = function ()
        ---@class PLUGIN_SETTINGS
        local COMMENT_SETTINGS = {
            --Add a space b/w comment and the line
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
            pre_hook = function(ctx)
                local U = require "Comment.utils"

                -- Treesitter intergration
                local location = nil
                if ctx.ctype == U.ctype.block then
                    location = require("ts_context_commentstring.utils").get_cursor_location()
                elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                    location = require("ts_context_commentstring.utils").get_visual_start_location()
                end

                return require("ts_context_commentstring.internal").calculate_commentstring {
                    key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
                    location = location,
                }
            end,

            ---Function to call after (un)comment
            post_hook = nil,
        }

        require('Comment').setup(COMMENT_SETTINGS)
    end,
}
