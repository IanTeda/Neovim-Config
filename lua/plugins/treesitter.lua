-- ----------------------------------------------------------------------------
-- TREESITTER
-- Improved code highlighting
--
-- File: ~/.config/nvim/lua/plugins/treesitter.lua
-- Repo: https://github.com/nvim-treesitter/nvim-treesitter
-- ----------------------------------------------------------------------------

return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		---@class TREESITTER_SETTINGS
		local TREESITTER_SETTINGS = {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"rust",
				"javascript",
				"regex",
				"bash",
				"markdown",
				"markdown_inline",
                "beancount",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (or "all")
			ignore_install = {},

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			highlight = {
				enable = true,

				-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
				-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
				-- the name of the parser)
				-- list of language that will be disabled
				--disable = { },
				-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
				--disable = function(lang, buf)
				--    local max_filesize = 100 * 1024 -- 100 KB
				--    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				--    if ok and stats and stats.size > max_filesize then
				--        return true
				--    end
				--end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<M-space>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		}

		-- Setup treesitter
		require("nvim-treesitter.configs").setup(TREESITTER_SETTINGS)
	end,
}
