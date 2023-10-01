-- DAP (Debug Adapter Protocol)
-- A Debug Adapter Protocol client implementation for Neovim.
--
-- File: /location/of/file
-- Repo: http://github.com/username/repo
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"mfussenegger/nvim-dap",

	-- VERSIONING
	-- If you want to install a specific revision of a plugin, you can use
	-- `commit`,`tag`, `branch`, `version`.
	version = "*",

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
		"rcarriga/nvim-dap-ui",
		"williamboman/mason.nvim",
		-- This plugin adds virtual text support to nvim-dap. nvim-treesitter
		-- is used to find variable definitions.
		--'theHamsta/nvim-dap-virtual-text',
		"jay-babu/mason-nvim-dap.nvim",
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
	config = function()
		-- require("dap").setup()

		-- require("nvim-dap-virtual-text").setup()

		require("mason").setup()
		require("mason-nvim-dap").setup({
			-- Ensure DAP are installed by Mason package manager
			ensure_installed = {
				"codelldb", -- Rust DAP
			},
			-- Set up DAP in a predefined manner
            -- The handlers table provides a dynamic way of setting up sources 
            -- and any other logic needed; it can also do that during runtime. 
            -- To override the fallback handler put your custom one as first 
            -- list element in the table. To override any other handler pass 
            -- your custom function to the respective key.
			-- handlers = {
            --
            -- },
		})
	end,
}
