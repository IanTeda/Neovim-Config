-------------------------------------------------------------------------------
-- FORMATTER
-- A format runner for Neovim
--
-- File: ~/.config/nvim/lua/plugins/formatter.lua
-- Repo: https://github.com/mhartington/formatter.nvim
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"mhartington/formatter.nvim",

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
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
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
		local util = require("formatter.util")

		-- Put plugin settings into a local variable for easier reading
		local PLUGIN_SETTINGS = {
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					function()
						return {
							exe = vim.fn.stdpath("data") .. "/mason/bin/stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},

				-- beancount = {
				--
				-- },
				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
                    -- Format with LSP if there are not other formatters
                    -- https://github.com/mhartington/formatter.nvim/issues/192
					function()
						local formatters = require("formatter.util").get_available_formatters_for_ft(vim.bo.filetype)
						local formatters_len = 0
						for _ in pairs(formatters) do
							formatters_len = formatters_len + 1
						end
						if formatters_len == 0 then
							vim.lsp.buf.format()
						end
					end,
				},
			},
		}

		require("formatter").setup(PLUGIN_SETTINGS)

		vim.keymap.set("n", "<leader>f", "<cmd>Format<cr>", { desc = "Format document" })
		vim.keymap.set("n", "<leader>F", "<cmd>FormatWrite<cr>", { desc = "Format and write document" })
	end,
}
