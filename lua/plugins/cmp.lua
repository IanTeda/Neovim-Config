-- ----------------------------------------------------------------------------
-- NVIM-CMP
-- A completion engine plugin for neovim
--
-- File: ~/.config/nvim/lua/plugins/cmp.lua
-- Repo: https://github.com/hrsh7th/nvim-cmp
-- ----------------------------------------------------------------------------

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",

		-- Adds a number of user-friendly snippets
		"rafamadriz/friendly-snippets",

		-- Buffer completions
		"hrsh7th/cmp-buffer",

		-- Path completion
		"hrsh7th/cmp-path",

		-- Command line completions
		"hrsh7th/cmp-cmdline",

		-- Lau code completion
		"hrsh7th/cmp-nvim-lua",

		-- Beancount account completion
		"crispgm/cmp-beancount",
	},
	config = function()
		--   פּ ﯟ   some other good icons
		local kind_icons = {
			Text = "󰊄",
			Method = "m",
			Function = "󰊕",
			Constructor = "",
			Field = "",
			Variable = "󰫧",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "󰌆",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "󰉺",
		}
		-- find more here: https://www.nerdfonts.com/cheat-sheet

		-- See `:help cmp`
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Ensure snippts is loaded
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		-- [[ Configure CMP ]]
		cmp.setup({
			-- REQUIRED - you must specify a snippet engine
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			-- Snippet window decorations
			window = {
				-- completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			-- Key mapping for code completion
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(), -- <ctrl+n> = Select next code completion
				["<C-p>"] = cmp.mapping.select_prev_item(), -- <ctrl+p> = select previous code completion
				["<C-d>"] = cmp.mapping.scroll_docs(-4), -- <ctrl+d> = scroll snippet docs down
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- <ctrl+f> = scroll snippet docs up
				["<C-Space>"] = cmp.mapping.complete({}), --
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),

				-- Super tabs, to navigate through snippets
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "path" }, -- File path
				{ name = "nvim_lsp", keyword_length = 3 }, -- Language server completion
				{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
				{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.
				{ name = "buffer", keyword_length = 2 }, -- source current buffer
				{ name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
				{ name = "calc" }, -- Maths calculations
				-- { name = "luasnip" },
				{ name = "crates" }, -- Rust creates
				-- { name = "beancount",
				-- 	option = {
				-- 		account = "/home/ian/Projects/Plain-Text-Ledger/main.beancount",
				-- 	},
				-- },
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
					vim_item.menu = ({
						lsp = "[LSP]",
						luasnip = "[Snippet]",
						buffer = "[Buffer]",
						path = "[Path]",
						crates = "[Crates]",
					})[entry.source.name]
					return vim_item
				end,
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		})
	end,
}
