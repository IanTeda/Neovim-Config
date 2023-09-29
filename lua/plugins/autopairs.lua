-- ----------------------------------------------------------------------------
-- AUTOPAIRS
-- A super powerful autopair plugin for Neovim that supports multiple characters.
--
-- File: ~/.config/nvim/lua/plugins/autopairs.lua
-- Repo: https://github.com/windwp/nvim-autopairs
-- ----------------------------------------------------------------------------

return {
	"windwp/nvim-autopairs",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	event = "InsertEnter",
	-- opts = {} -- this is equalent to setup({}) function
	config = function()
		---@class AUTOPAIRS_SETTINGS
		local AUTOPAIRS_SETTINGS = {
			-- Setup Treesitter intergration
			check_ts = true,
			ts_config = {
				lua = { "string", "source" },
				javascript = { "string", "template_string" },
				java = false,
			},

			-- Disable auto pairs for the following file types
			disable_filetype = { "TelescopePrompt", "spectre_panel" },

			-- Fast wrap options
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0, -- Offset from pattern match
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "PmenuSel",
				highlight_grey = "LineNr",
			},
		}

		require("nvim-autopairs").setup(AUTOPAIRS_SETTINGS)

		-- TODO: Add cmp intergration
		-- Hook autopairs into code completion CMP
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			print("Error Loading CMP Plugin")
			return
		end
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	end,
}
