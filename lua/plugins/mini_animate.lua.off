-------------------------------------------------------------------------------
-- MINI ANIMATE
-- Animate common Neovim actions
--
-- File: ~/.config/nvim/lua/plugins/mini_animate.lua
-- Repo: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-animate.md
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"echasnovski/mini.animate",

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
		-- Cursor path
		cursor = {
			-- Whether to enable this animation
			enable = true,

			-- Timing of animation (how steps will progress in time)
			-- timing = --<function: implements linear total 250ms animation duration>,

			-- Path generator for visualized cursor movement
			-- path = --<function: implements shortest line path>,
		},

		-- Vertical scroll
		scroll = {
			-- Whether to enable this animation
			enable = true,

			-- Timing of animation (how steps will progress in time)
			-- timing = --<function: implements linear total 250ms animation duration>,

			-- Subscroll generator based on total scroll
			-- subscroll = --<function: implements equal scroll with at most 60 steps>,
		},

		-- Window resize
		resize = {
			-- Whether to enable this animation
			enable = true,

			-- Timing of animation (how steps will progress in time)
			-- timing = --<function: implements linear total 250ms animation duration>,

			-- Subresize generator for all steps of resize animations
			-- subresize = --<function: implements equal linear steps>,
		},

		-- Window open
		open = {
			-- Whether to enable this animation
			enable = true,

			-- Timing of animation (how steps will progress in time)
			-- timing = --<function: implements linear total 250ms animation duration>,

			-- Floating window config generator visualizing specific window
			-- winconfig = --<function: implements static window for 25 steps>,

			-- 'winblend' (window transparency) generator for floating window
			-- winblend = --<function: implements equal linear steps from 80 to 100>,
		},

		-- Window close
		close = {
			-- Whether to enable this animation
			enable = true,

			-- Timing of animation (how steps will progress in time)
			-- timing = --<function: implements linear total 250ms animation duration>,

			-- Floating window config generator visualizing specific window
			-- winconfig = --<function: implements static window for 25 steps>,

			-- 'winblend' (window transparency) generator for floating window
			-- winblend = --<function: implements equal linear steps from 80 to 100>,
		},
	},
}
