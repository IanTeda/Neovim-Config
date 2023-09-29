-------------------------------------------------------------------------------
-- Lau Lines
-- A blazing fast and easy to configure Neovim statusline written in Lua.
--
-- File: ~/.config/nvim/lua/plugins/lualine.lua
-- Repo: https://github.com/nvim-lualine/lualine.nvim 
-------------------------------------------------------------------------------

return {
    -- PLUGIN TO LAZY LOAD
    -- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
   'nvim-lualine/lualine.nvim', 
    
    -- VERSIONING
    -- If you want to install a specific revision of a plugin, you can use 
    -- `commit`,`tag`, `branch`, `version`.
    version = "*",
    
    -- DEPENDENCIES
    -- A list of plugin names or plugin specs that should be loaded when the 
    -- plugin loads. Dependencies are always lazy-loaded unless specified 
    -- otherwise. When specifying a name, make sure the plugin spec has been
    -- defined somewhere else.
    dependencies = { 
        { 'nvim-tree/nvim-web-devicons', lazy=true }
    },

    -- CONFIG 
    -- Config is executed when the plugin loads. The default implementation 
    -- will automatically run require(MAIN).setup(opts). Lazy uses several
    -- heuristics to determine the plugin’s MAIN module automatically based 
    -- on the plugin’s name. See also opts. To use the default implementation 
    -- without opts set config to true.
    config = function ()

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = false,
            update_in_insert = false,
            always_visible = true,
        }

        local diff = {
            "diff",
            colored = false,
            symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = hide_in_width
        }

        local mode = {
            "mode",
            fmt = function(str)
                return "-- " .. str .. " --"
            end,
        }

        local filetype = {
            "filetype",
            icons_enabled = false,
            icon = nil,
        }

        local branch = {
            "branch",
            icons_enabled = true,
            icon = "",
        }

        local location = {
            "location",
            padding = 0,
        }

        -- cool function for progress
        local progress = function()
            local current_line = vim.fn.line(".")
            local total_lines = vim.fn.line("$")
            local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
            local line_ratio = current_line / total_lines
            local index = math.ceil(line_ratio * #chars)
            return chars[index]
        end

        local spaces = function()
            return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end

        ---@class PLUGIN_SETTINGS
        local PLUGIN_SETTINGS = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
          },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {}
        }
        require('lualine').setup(PLUGIN_SETTINGS)
    end,
}
