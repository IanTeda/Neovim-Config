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

	-- CONFIG
	-- Config is executed when the plugin loads. The default implementation
	-- will automatically run require(MAIN).setup(opts). Lazy uses several
	-- heuristics to determine the plugin’s MAIN module automatically based
	-- on the plugin’s name. See also opts. To use the default implementation
	-- without opts set config to true.
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-key bindings
			-- to learn the available actions
			-- lsp_zero.default_keymaps({ buffer = bufnr })
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
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
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" }, -- Suppress global vim error
								},
							},
						},
					})
				end,
				-- Ansible
				["ansiblels"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.ansiblels.setup({
						filetypes = { "yaml", "yml", "yaml.ansible" },
					})
				end,
				-- -- Rust Analyzer
				-- ["rust_analyzer"] = function ()
				--     local lspconfig = require("lspconfig")
				--     lspconfig.rust_analyzer.setup({
				--
				--     })
				-- end
			},
		})

		-- LSP Diagnostics Options Setup
		local sign = function(opts)
			vim.fn.sign_define(opts.name, {
				texthl = opts.name,
				text = opts.text,
				numhl = "",
			})
		end

		sign({ name = "DiagnosticSignError", text = "" })
		sign({ name = "DiagnosticSignWarn", text = "" })
		sign({ name = "DiagnosticSignHint", text = "" })
		sign({ name = "DiagnosticSignInfo", text = "" })

		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			update_in_insert = true,
			underline = true,
			severity_sort = false,
			float = {
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.cmd([[
            set signcolumn=yes
            autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
        ]])
	end,
}
