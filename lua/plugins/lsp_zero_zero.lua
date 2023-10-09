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

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Require Mason LSP package manager
		require("mason").setup({})

		-- Set up set up Language servers
		require("mason-lspconfig").setup({
			-- Get Mason to install as minimum these language servers
            -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
			ensure_installed = { 
                "ansiblels",                -- Ansible
                "beancount",                -- Beancount
                "golangci_lint_ls",         -- GO Lang
                "html",                     -- html
                "intelephense",             -- PHP
                "jedi_language_server",     -- Python
                "jsonls",                   -- JSON
                "lemminx",                  -- XML
                "lua_ls",                   -- Lua
                "marksman",                 -- Markdown
                "rust_analyzer",            -- Rust
                "sqlls",                    -- SQL
                "taplo",                    -- TOML
                "tsserver",                 -- Javascript & Typescript
                "yamlls",                   -- YAML
            },

            -- Link installed binaries to Neovim LSP
            handlers = {
				-- Get LSP Zero to handle the Language Server configuration
				lsp_zero.default_setup,

				-- Custom configuration for language servers go here

				-- Lua Language Server custom config
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								workspace = { checkThirdParty = false },
								telemetry = { enable = false },
								diagnostics = {
									globals = { "vim" }, -- Suppress global vim error
								},
							},
						},
					})
				end,

				-- Beancount Language Server custom config
				-- beancount = lsp_zero.noop -- Turning off for now see https://github.com/polarmutex/beancount-language-server/issues/222
				beancount = function()
					require("lspconfig").beancount.setup({
						cmd = { "/home/ian/.local/share/nvim/mason/bin/beancount-language-server" },
                        on_attach = on_attach,
                        capabilities = capabilities,
						init_options = {
							journal_file = "/home/ian/Worland/Workspaces/plain-text-ledger/main.beancount",
						},
					})
				end,

				-- Turn of Language Server with "lsp_zero.noop"
				-- tsserver = lsp_zero.noop,
			},
		})

		-- -- LSP Diagnostics Options Setup
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
