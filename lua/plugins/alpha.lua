-------------------------------------------------------------------------------
-- ALPHA DASHBOARD
-- A fast and fully programmable greeter for neovim.
--
-- File: ~/.config/nvim/lua/plugins/alpha.lua
-- Repo: https://github.com/goolord/alpha-nvim
-------------------------------------------------------------------------------

return {
	-- PLUGIN TO LAZY LOAD
	-- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
	"goolord/alpha-nvim",

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
		"nvim-tree/nvim-web-devicons",
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
	-- opts = {
	--     require'alpha.themes.startify'.config
	-- }

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
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")
		-- dashboard.section.header.val = {
		-- 	[[                               __                ]],
		-- 	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		-- 	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		-- 	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		-- 	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		-- 	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		-- }
   		dashboard.section.header.val = {
[[      _____                    _____                    _____                    _____          ]],
[[     /\    \                  /\    \                  /\    \                  /\    \         ]],
[[    /::\    \                /::\    \                /::\    \                /::\    \        ]],
[[    \:::\    \              /::::\    \              /::::\    \              /::::\    \       ]],
[[     \:::\    \            /::::::\    \            /::::::\    \            /::::::\    \      ]],
[[      \:::\    \          /:::/\:::\    \          /:::/\:::\    \          /:::/\:::\    \     ]],
[[       \:::\    \        /:::/__\:::\    \        /:::/  \:::\    \        /:::/__\:::\    \    ]],
[[       /::::\    \      /::::\   \:::\    \      /:::/    \:::\    \      /::::\   \:::\    \   ]],
[[      /::::::\    \    /::::::\   \:::\    \    /:::/    / \:::\    \    /::::::\   \:::\    \  ]],
[[     /:::/\:::\    \  /:::/\:::\   \:::\    \  /:::/    /   \:::\ ___\  /:::/\:::\   \:::\    \ ]],
[[    /:::/  \:::\____\/:::/__\:::\   \:::\____\/:::/____/     \:::|    |/:::/  \:::\   \:::\____\]],
[[   /:::/    \::/    /\:::\   \:::\   \::/    /\:::\    \     /:::|____|\::/    \:::\  /:::/    /]],
[[  /:::/    / \/____/  \:::\   \:::\   \/____/  \:::\    \   /:::/    /  \/____/ \:::\/:::/    / ]],
[[ /:::/    /            \:::\   \:::\    \       \:::\    \ /:::/    /            \::::::/    /  ]],
[[/:::/    /              \:::\   \:::\____\       \:::\    /:::/    /              \::::/    /   ]],
[[\::/    /                \:::\   \::/    /        \:::\  /:::/    /               /:::/    /    ]],
[[ \/____/                  \:::\   \/____/          \:::\/:::/    /               /:::/    /     ]],
[[                           \:::\    \               \::::::/    /               /:::/    /      ]],
[[                            \:::\____\               \::::/    /               /:::/    /       ]],
[[                             \::/    /                \::/____/                \::/    /        ]],
[[                              \/____/                  ~~                       \/____/         ]],
        }
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}

		local function footer()
			-- NOTE: requires the fortune-mod package to work
			-- local handle = io.popen("fortune")
			-- local fortune = handle:read("*a")
			-- handle:close()
			-- return fortune
			return "ianteda.com"
		end

		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true
		-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
		alpha.setup(dashboard.opts)
	end,
}
