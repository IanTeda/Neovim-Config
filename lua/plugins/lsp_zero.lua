-------------------------------------------------------------------------------
-- LSP ZERO
-- Collection of functions that will help you setup Neovim's LSP client, so you
-- can get IDE-like features with minimum effort.
--
-- File: ~/.config/nvim/lua/plugins/lsp_zero.lua
-- Repo: https://github.com/VonHeikemen/lsp-zero.nvim
-- Ref: https://dev.to/vonheikemen/getting-started-with-neovims-native-lsp-client-in-the-year-of-2022-the-easy-way-bp3
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"VonHeikemen/lsp-zero.nvim",

	-- VERSIONING
	-- If you want to install a specific revision of a plugin, you can use
	-- `commit`,`tag`, `branch`, `version`.
	branch = "v3.x",

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
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
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
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		-- see :help lsp-zero-guide:integrate-with-mason-nvim
		-- to learn how to use mason.nvim with lsp-zero
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ansiblels", -- Ansible
				"arduino_language_server", -- Ardunino
				"beancount", -- Beancount
				"cssls", -- CSS
				"docker_compose_language_service", -- Docker Compose
				"jsonls", -- JSON
				"lua_ls", -- LUA
				"marksman", -- Markdown
				"tsserver", -- Javascript
				"rust_analyzer", -- Rust
				"yamlls", -- YAML
			},
			handlers = {
				lsp_zero.default_setup,
				tsserver = function()
					require("lspconfig").tsserver.setup({
						single_file_support = false,
						on_attach = function(client, bufnr)
							print("hello tsserver")
						end,
					})
				end,
			},
		})
	end,
}
