-------------------------------------------------------------------------------
-- MINI INDENT SCOPE
-- Animate common Neovim actions
--
-- File: ~/.config/nvim/lua/plugins/mini_indentscope.lua
-- Repo:https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-indentscope.md
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"echasnovski/mini.indentscope",

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

	-- LAZY
	-- When true, the plugin will only be loaded when needed. Lazy-loaded
	-- plugins are automatically loaded when their Lua modules are required,
	-- or when one of the lazy-loading handlers triggers
	-- lazy = true,

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
		-- Draw options
		draw = {
			-- Delay (in ms) between event and start of drawing scope indicator
			delay = 100,

			-- Animation rule for scope's first drawing. A function which, given
			-- next and total step numbers, returns wait time (in ms). See
			-- |MiniIndentscope.gen_animation| for builtin options. To disable
			-- animation, use `require('mini.indentscope').gen_animation.none()`.
			-- animation = --<function: implements constant 20ms between steps>,

			-- Symbol priority. Increase to display on top of more symbols.
			priority = 2,
		},

		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			-- Textobjects
			object_scope = "ii",
			object_scope_with_border = "ai",

			-- Motions (jump to respective border line; if not present - body line)
			goto_top = "[i",
			goto_bottom = "]i",
		},

		-- Options which control scope computation
		options = {
			-- Type of scope's border: which line(s) with smaller indent to
			-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
			border = "both",

			-- Whether to use cursor column when computing reference indent.
			-- Useful to see incremental scopes with horizontal cursor movements.
			indent_at_cursor = true,

			-- Whether to first check input line to be a border of adjacent scope.
			-- Use it if you want to place cursor on function header to get scope of
			-- its body.
			try_as_border = false,
		},

		-- Which character to use for drawing scope indicator
		symbol = "╎",
	},

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
