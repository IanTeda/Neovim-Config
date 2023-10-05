-------------------------------------------------------------------------------
-- BUFFER LINES
-- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
--
-- File: ~/.config/nvim/lua/plugins/bufferlines.lua
-- Repo: https://github.com/akinsho/bufferline.nvim
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD Lazy.vim will look for lua files in the
	-- ~/.config/nvim/lua/plugins folder
	"akinsho/bufferline.nvim",

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
		"nvim-tree/nvim-web-devicons",
        'moll/vim-bbye',
	},

	-- LAZY
	-- When true, the plugin will only be loaded when needed. Lazy-loaded
	-- plugins are automatically loaded when their Lua modules are required,
	-- or when one of the lazy-loading handlers triggers
	--lazy = true,

	-- COMMAND
	-- Lazy load on command
	--cmd = {},

	-- FILE TYPE
	-- Lazy load on file type
	--ft = {},

	-- PRIORITY
	-- Only useful for start plugins (lazy=false) to force loading certain
	-- plugins first. Default priority is 50. It’s recommended to set this to
	-- a high number for color schemes.
	--priority = number?,

	-- OPTIONAL
	-- When a spec is tagged optional, it will only be included in the
	-- final spec, when the same plugin has been specified at least once
	-- somewhere else without optional. This is mainly useful for Neovim
	-- distros, to allow setting options on plugins that may/may not be part
	-- of the user’s plugins
	--optional = boolean?,

	-- SETTINGS
	-- opts should be a table (will be merged with parent specs), return a
	-- table (replaces parent specs) or should change a table. The table will
	-- be passed to the Plugin.config() function. Setting this value will imply
	-- Plugin.config()
	opts = {
		options = {
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
			-- NOTE: this plugin is designed with this icon in mind,
			-- and so changing this is NOT recommended, this is intended
			-- as an escape hatch for people who cannot bear it for whatever reason
			indicator_icon = "▎",
			buffer_close_icon = "",
			-- buffer_close_icon = '',
			modified_icon = "●",
			close_icon = "",
			-- close_icon = '',
			left_trunc_marker = "",
			right_trunc_marker = "",
			--- name_formatter can be used to change the buffer's label in the bufferline.
			--- Please note some names can/will break the
			--- bufferline so use this at your discretion knowing that it has
			--- some limitations that will *NOT* be fixed.
			-- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
			--   -- remove extension from markdown files for example
			--   if buf.name:match('%.md') then
			--     return vim.fn.fnamemodify(buf.name, ':t:r')
			--   end
			-- end,
			max_name_length = 30,
			max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			diagnostics = false, -- | "nvim_lsp" | "coc",
			diagnostics_update_in_insert = false,
			-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
			--   return "("..count..")"
			-- end,
			-- NOTE: this will be called a lot so don't do any heavy processing here
			-- custom_filter = function(buf_number)
			--   -- filter out filetypes you don't want to see
			--   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
			--     return true
			--   end
			--   -- filter out by buffer name
			--   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
			--     return true
			--   end
			--   -- filter out based on arbitrary rules
			--   -- e.g. filter out vim wiki buffer from tabline in your work repo
			--   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
			--     return true
			--   end
			-- end,
			offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			-- can also be a table containing 2 custom separators
			-- [focused and unfocused]. eg: { '|', '|' }
			separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			-- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
			--   -- add custom logic
			--   return buffer_a.modified > buffer_b.modified
			-- end
		},
		highlights = {
			fill = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
			},
			background = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
			},

			-- buffer_selected = {
			--   guifg = {attribute='fg',highlight='#ff0000'},
			--   guibg = {attribute='bg',highlight='#0000ff'},
			--   gui = 'none'
			--   },
			buffer_visible = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
			},

			close_button = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
			},
			close_button_visible = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
			},
			-- close_button_selected = {
			--   guifg = {attribute='fg',highlight='TabLineSel'},
			--   guibg ={attribute='bg',highlight='TabLineSel'}
			--   },

			tab_selected = {
				guifg = { attribute = "fg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "Normal" },
			},
			tab = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
			},
			tab_close = {
				-- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
				guifg = { attribute = "fg", highlight = "TabLineSel" },
				guibg = { attribute = "bg", highlight = "Normal" },
			},

			duplicate_selected = {
				guifg = { attribute = "fg", highlight = "TabLineSel" },
				guibg = { attribute = "bg", highlight = "TabLineSel" },
				gui = "italic",
			},
			duplicate_visible = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
				gui = "italic",
			},
			duplicate = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
				gui = "italic",
			},

			modified = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
			},
			modified_selected = {
				guifg = { attribute = "fg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "Normal" },
			},
			modified_visible = {
				guifg = { attribute = "fg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
			},

			separator = {
				guifg = { attribute = "bg", highlight = "TabLine" },
				guibg = { attribute = "bg", highlight = "TabLine" },
			},
			separator_selected = {
				guifg = { attribute = "bg", highlight = "Normal" },
				guibg = { attribute = "bg", highlight = "Normal" },
			},
			-- separator_visible = {
			--   guifg = {attribute='bg',highlight='TabLine'},
			--   guibg = {attribute='bg',highlight='TabLine'}
			--   },
			indicator_selected = {
				guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
				guibg = { attribute = "bg", highlight = "Normal" },
			},
		},
	},

	-- INIT
	-- Init functions are always executed during startup
	--init = function()
	--end,

	-- CONFIG
	-- Config is executed when the plugin loads. The default implementation
	-- will automatically run require(MAIN).setup(opts). Lazy uses several
	-- heuristics to determine the plugin’s MAIN module automatically based
	-- on the plugin’s name. See also opts. To use the default implementation
	-- without opts set config to true.
	--config = function ()
	--    -- Put plugin settings into a local variable for easier reading
	--    local PLUGIN_SETTINGS = {
	--    }
	--    require('plugin').setup(PLUGIN_SETTINGS)
	--end,
}
