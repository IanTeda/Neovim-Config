-------------------------------------------------------------------------------
-- fugitive.vim
-- Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git
-- plugin for Vim? Either way, it's "so awesome, it should be illegal". That's why it's called Fugitive.
--
-- File: ~/.config/nvim/lua/plugins/fugitive.lua
-- Repo: https://github.com/tpope/vim-fugitive
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"tpope/vim-fugitive",

	-- VERSIONING
	-- If you want to install a specific revision of a plugin, you can use
	-- `commit`,`tag`, `branch`, `version`.
	-- version = "*",

	-- KEY MAPPING
	-- Key mappings will load the plugin the first time they get executed.
	-- keys = {"<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree"} ,
	keys = {
		{ "<leader>gr", "<cmd>Gread<cr>", desc = "read file from git" },
		{ "<leader>gb", "<cmd>G blame<cr>", desc = "read file from git" },
	},

	-- DEPENDENCIES
	-- A list of plugin names or plugin specs that should be loaded when the
	-- plugin loads. Dependencies are always lazy-loaded unless specified
	-- otherwise. When specifying a name, make sure the plugin spec has been
	-- defined somewhere else.
	dependencies = {
		"tpope/vim-rhubarb", -- Github extension. Enables :GBrowse from fugitive.vim to open GitHub URLs.
	},

	-- LAZY
	-- When true, the plugin will only be loaded when needed. Lazy-loaded
	-- plugins are automatically loaded when their Lua modules are required,
	-- or when one of the lazy-loading handlers triggers
	lazy = false,

	-- COMMAND
	-- Lazy load on command
	cmd = {
        "G",
		"Gvdiffsplit",
		"Gdiffsplit",
		"Gedit",
		"Gsplit",
		"Gread",
		"Gwrite",
		"Ggrep",
		"GMove",
		"GRename",
		"GDelete",
		"GRemove",
		"GBrowse",
		"Git",
		"Gstatus",
	},

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
	--opts = {}

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
