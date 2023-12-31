-------------------------------------------------------------------------------
-- RUST TOOLS
-- A plugin to improve your rust experience in Neovim.
--
-- File: ~/.config/nvim/lua/plugins/rust-tools.lua
-- Repo: https://github.com/simrat39/rust-tools.nvim
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"simrat39/rust-tools.nvim",

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
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
		"VonHeikemen/lsp-zero.nvim",
	},

	-- FILE TYPE
	-- Lazy load on file type
	ft = "rust",

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
		tools = { -- rust-tools options

			runnables = {
				use_telescope = true,
			},

			-- how to execute terminal commands
			-- options right now: termopen / quickfix / toggleterm / vimux
			-- TODO: This option is crashing the plug in load
			-- executor = require("rust-tools.executors").toggleterm,

			-- callback to execute once rust-analyzer is done initializing the workspace
			-- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
			on_initialized = nil,

			-- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
			reload_workspace_from_cargo_toml = true,

			-- These apply to the default RustSetInlayHints command
			inlay_hints = {
				-- automatically set inlay hints (type hints)
				-- default: true
				auto = true,

				-- Only show inlay hints for the current line
				only_current_line = false,

				-- whether to show parameter hints with the inlay hints or not
				-- default: true
				show_parameter_hints = false,

				-- prefix for parameter hints
				-- default: "<-"
				parameter_hints_prefix = "",

				-- prefix for all the other hints (type, chaining)
				-- default: "=>"
				other_hints_prefix = "",

				-- whether to align to the length of the longest line in the file
				max_len_align = false,

				-- padding from the left if max_len_align is true
				max_len_align_padding = 1,

				-- whether to align to the extreme right or not
				right_align = false,

				-- padding from the right if right_align is true
				right_align_padding = 7,

				-- The color of the hints
				highlight = "Comment",
			},

			-- options same as lsp hover / vim.lsp.util.open_floating_preview()
			hover_actions = {

				-- the border that is used for the hover window
				-- see vim.api.nvim_open_win()
				border = {
					{ "╭", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╮", "FloatBorder" },
					{ "│", "FloatBorder" },
					{ "╯", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╰", "FloatBorder" },
					{ "│", "FloatBorder" },
				},

				-- Maximal width of the hover window. Nil means no max.
				max_width = nil,

				-- Maximal height of the hover window. Nil means no max.
				max_height = nil,

				-- whether the hover action window gets automatically focused
				-- default: false
				auto_focus = false,
			},

			-- settings for showing the crate graph based on graphviz and the dot
			-- command
			crate_graph = {
				-- Backend used for displaying the graph
				-- see: https://graphviz.org/docs/outputs/
				-- default: x11
				backend = "x11",
				-- where to store the output, nil for no output stored (relative
				-- path from pwd)
				-- default: nil
				output = nil,
				-- true for all crates.io and external crates, false only the local
				-- crates
				-- default: true
				full = true,

				-- List of backends found on: https://graphviz.org/docs/outputs/
				-- Is used for input validation and autocompletion
				-- Last updated: 2021-08-26
				enabled_graphviz_backends = {
					"bmp",
					"cgimage",
					"canon",
					"dot",
					"gv",
					"xdot",
					"xdot1.2",
					"xdot1.4",
					"eps",
					"exr",
					"fig",
					"gd",
					"gd2",
					"gif",
					"gtk",
					"ico",
					"cmap",
					"ismap",
					"imap",
					"cmapx",
					"imap_np",
					"cmapx_np",
					"jpg",
					"jpeg",
					"jpe",
					"jp2",
					"json",
					"json0",
					"dot_json",
					"xdot_json",
					"pdf",
					"pic",
					"pct",
					"pict",
					"plain",
					"plain-ext",
					"png",
					"pov",
					"ps",
					"ps2",
					"psd",
					"sgi",
					"svg",
					"svgz",
					"tga",
					"tiff",
					"tif",
					"tk",
					"vml",
					"vmlz",
					"wbmp",
					"webp",
					"xlib",
					"x11",
				},
			},
		},

		-- all the opts to send to nvim-lspconfig
		-- these override the defaults set by rust-tools.nvim
		-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
		server = {
			-- standalone file support
			-- setting it to false may improve startup time
			-- standalone = true,
			-- on_attach is a callback called when the language server attachs to the buffer
			on_attach = on_attach,
			settings = {
				-- to enable rust-analyzer settings visit:
				-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
				["rust-analyzer"] = {
					-- enable clippy on save
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		},

		-- debugging stuff
		dap = {
			adapter = {
				type = "executable",
				command = "codelldb",
				name = "codelldb",
			},
		},
	},
}
