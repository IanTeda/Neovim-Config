-------------------------------------------------------------------------------
-- RENAMER
-- A Visual-Studio-Code-like renaming UI for Neovim,
--
-- File: ~/.config/nvim/lua/plugins/renamer.lua
-- Repo: https://github.com/filipdutescu/renamer.nvim
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"filipdutescu/renamer.nvim",

	-- VERSIONING
	-- If you want to install a specific revision of a plugin, you can use
	-- `commit`,`tag`, `branch`, `version`.
	branch = "master",

	-- KEY MAPPING
	-- Key mappings will load the plugin the first time they get executed.
	-- keys = {"<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree"} ,
	--keys = {},

	-- DEPENDENCIES
	-- A list of plugin names or plugin specs that should be loaded when the
	-- plugin loads. Dependencies are always lazy-loaded unless specified
	-- otherwise. When specifying a name, make sure the plugin spec has been
	-- defined somewhere else.
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	-- LAZY
	-- When true, the plugin will only be loaded when needed. Lazy-loaded
	-- plugins are automatically loaded when their Lua modules are required,
	-- or when one of the lazy-loading handlers triggers
	--lazy = true,

	-- COMMAND
	-- Lazy load on command
	--cmd = {},

	-- FILETYPE
	-- Lazy load on filetype
	--ft = {},

	-- PRIORITY
	-- Only useful for start plugins (lazy=false) to force loading certain
	-- plugins first. Default priority is 50. It’s recommended to set this to
	-- a high number for colorschemes.
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
	--opts = {}

	-- CONFIG
	-- Config is executed when the plugin loads. The default implementation
	-- will automatically run require(MAIN).setup(opts). Lazy uses several
	-- heuristics to determine the plugin’s MAIN module automatically based
	-- on the plugin’s name. See also opts. To use the default implementation
	-- without opts set config to true.
	config = function()
		local mappings_utils = require("renamer.mappings.utils")

		-- Put plugin settings into a local variable for easier reading
		local PLUGIN_SETTINGS = {
			-- The popup title, shown if `border` is true
			title = "Rename",
			-- The padding around the popup content
			padding = {
				top = 0,
				left = 0,
				bottom = 0,
				right = 0,
			},
			-- The minimum width of the popup
			min_width = 15,
			-- The maximum width of the popup
			max_width = 45,
			-- Whether or not to shown a border around the popup
			border = true,
			-- The characters which make up the border
			border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			-- Whether or not to highlight the current word references through LSP
			show_refs = true,
			-- Whether or not to add resulting changes to the quickfix list
			with_qf_list = true,
			-- Whether or not to enter the new name through the UI or Neovim's `input`
			-- prompt
			with_popup = true,
			-- The keymaps available while in the `renamer` buffer. The example below
			-- overrides the default values, but you can add others as well.
			mappings = {
				["<c-i>"] = mappings_utils.set_cursor_to_start,
				["<c-a>"] = mappings_utils.set_cursor_to_end,
				["<c-e>"] = mappings_utils.set_cursor_to_word_end,
				["<c-b>"] = mappings_utils.set_cursor_to_word_start,
				["<c-c>"] = mappings_utils.clear_line,
				["<c-u>"] = mappings_utils.undo,
				["<c-r>"] = mappings_utils.redo,
			},
			-- Custom handler to be run after successfully renaming the word. Receives
			-- the LSP 'textDocument/rename' raw response as its parameter.
			handler = nil,
		}
		require("renamer").setup(PLUGIN_SETTINGS)
	end,
}
