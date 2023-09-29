-------------------------------------------------------------------------------
-- Project
-- An all in one neovim plugin written in lua that provides superior project
-- management.
--
-- File: ~/.config/nvim/lua/plugins/project.lua
-- Repo: https://github.com/ahmedkhalf/project.nvim
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"ahmedkhalf/project.nvim",

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
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},

	-- LAZY
	-- When true, the plugin will only be loaded when needed. Lazy-loaded
	-- plugins are automatically loaded when their Lua modules are required,
	-- or when one of the lazy-loading handlers triggers
	lazy = true,

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
	config = function()
		---@class PLUGIN_SETTINGS
		local PLUGIN_SETTINGS = {
			---@usage set to false to disable project.nvim.
			--- This is on by default since it's currently the expected behavior.
			active = true,

			on_config_done = nil,

			---@usage set to true to disable setting the current-woriking directory
			--- Manual mode doesn't automatically change your root directory, so you have
			--- the option to manually do so using `:ProjectRoot` command.
			manual_mode = false,

			---@usage Methods of detecting the root directory
			--- Allowed values: **"lsp"** uses the native neovim lsp
			--- **"pattern"** uses vim-rooter like glob pattern matching. Here
			--- order matters: if one is not detected, the other is used as fallback. You
			--- can also delete or rearangne the detection methods.
			-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
			detection_methods = { "pattern" },

			---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

			---@ Show hidden files in telescope when searching for files in a project
			show_hidden = false,

			---@usage When set to false, you will get a message when project.nvim changes your directory.
			-- When set to false, you will get a message when project.nvim changes your directory.
			silent_chdir = true,

			---@usage list of lsp client names to ignore when using **lsp** detection. eg: { "efm", ... }
			ignore_lsp = {},

			---@type string
			---@usage path to store the project history for use in telescope
			datapath = vim.fn.stdpath("data"),
		}
		require("project_nvim").setup(PLUGIN_SETTINGS)
	end,
}
