return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
    },
    -- [[ LSP Configuration ]]
    config = function ()
        --  This function gets run when an LSP connects to a particiular buffer.
        local on_attach = function(_, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        -- Enable the following language servers
        --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
        --
        --  Add any additional override configuration in the following tables. They will be passed to
        --  the `settings` field of the server config.
        --
        --  If you want to override the default filetypes that your language server will attach to you can
        --  define the property 'filetypes' to the map in question.
        local servers = {
            -- clangd = {},
            -- gopls = {},
            -- pyright = {},
            -- rust_analyzer = {},
            -- tsserver = {},
            -- html = { filetypes = { 'html', 'twig', 'hbs'} },
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        }

        -- Setup neovim lua configuration
        require('neodev').setup()

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Mason Package Manager settings
        require("mason").setup({
            ---@since 1.0.0
            -- The directory in which to install packages.
            -- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

            ---@since 1.0.0
            -- Where Mason should put its bin location in your PATH. Can be one of:
            -- - "prepend" (default, Mason's bin location is put first in PATH)
            -- - "append" (Mason's bin location is put at the end of PATH)
            -- - "skip" (doesn't modify PATH)
            ---@type '"prepend"' | '"append"' | '"skip"'
            PATH = "prepend",

            ---@since 1.0.0
            -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
            -- debugging issues with package installations.
            log_level = vim.log.levels.INFO,

            ---@since 1.0.0
            -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
            -- packages that are requested to be installed will be put in a queue.
            max_concurrent_installers = 4,

            ---@since 1.0.0
            -- [Advanced setting]
            -- The registries to source packages from. Accepts multiple entries. Should a package with the same name exist in
            -- multiple registries, the registry listed first will be used.
            registries = {
                "github:mason-org/mason-registry",
            },

            ---@since 1.0.0
            -- The provider implementations to use for resolving supplementary package metadata (e.g., all available versions).
            -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
            -- Builtin providers are:
            --   - mason.providers.registry-api  - uses the https://api.mason-registry.dev API
            --   - mason.providers.client        - uses only client-side tooling to resolve metadata
            providers = {
                "mason.providers.registry-api",
                "mason.providers.client",
            },

            github = {
                ---@since 1.0.0
                -- The template URL to use when downloading assets from GitHub.
                -- The placeholders are the following (in order):
                -- 1. The repository (e.g. "rust-lang/rust-analyzer")
                -- 2. The release version (e.g. "v0.3.0")
                -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
                download_url_template = "https://github.com/%s/releases/download/%s/%s",
            },

            pip = {
                ---@since 1.0.0
                -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
                upgrade_pip = false,

                ---@since 1.0.0
                -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
                -- and is not recommended.
                --
                -- Example: { "--proxy", "https://proxyserver" }
                install_args = {},
            },
	        ui = {
                ---@since 1.0.0
                -- Whether to automatically check for new versions when opening the :Mason window.
                check_outdated_packages_on_open = true,

                ---@since 1.0.0
                -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
                border = "none",

                ---@since 1.0.0
                -- Width of the window. Accepts:
                -- - Integer greater than 1 for fixed width.
                -- - Float in the range of 0-1 for a percentage of screen width.
                width = 0.8,

                ---@since 1.0.0
                -- Height of the window. Accepts:
                -- - Integer greater than 1 for fixed height.
                -- - Float in the range of 0-1 for a percentage of screen height.
                height = 0.9,
		        icons = {
                    ---@since 1.0.0
                    -- The list icon to use for installed packages.
                    package_installed = "◍",
                    ---@since 1.0.0
                    -- The list icon to use for packages that are installing, or queued for installation.
                    package_pending = "◍",
                    ---@since 1.0.0
                    -- The list icon to use for packages that are not installed.
                    package_uninstalled = "◍",
                },
                keymaps = {
                    ---@since 1.0.0
                    -- Keymap to expand a package
                    toggle_package_expand = "<CR>",
                    ---@since 1.0.0
                    -- Keymap to install the package under the current cursor position
                    install_package = "i",
                    ---@since 1.0.0
                    -- Keymap to reinstall/update the package under the current cursor position
                    update_package = "u",
                    ---@since 1.0.0
                    -- Keymap to check for new version for the package under the current cursor position
                    check_package_version = "c",
                    ---@since 1.0.0
                    -- Keymap to update all installed packages
                    update_all_packages = "U",
                    ---@since 1.0.0
                    -- Keymap to check which installed packages are outdated
                    check_outdated_packages = "C",
                    ---@since 1.0.0
                    -- Keymap to uninstall a package
                    uninstall_package = "X",
                    ---@since 1.0.0
                    -- Keymap to cancel a package installation
                    cancel_installation = "<C-c>",
                    ---@since 1.0.0
                    -- Keymap to apply language filter
                    apply_language_filter = "<C-f>",
                    ---@since 1.1.0
                    -- Keymap to toggle viewing package installation log
                    toggle_package_install_log = "<CR>",
                    ---@since 1.8.0
                    -- Keymap to toggle the help view
                    toggle_help = "g?",
                },
	        },
        })

        -- Mason LSP Config Setup
        -- Bridge Mason.nvim with lspconfig
        local mason_lspconfig = require 'mason-lspconfig'
        mason_lspconfig.setup {
            -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
            -- This setting has no relation with the `automatic_installation` setting.
            ---@type string[]
            ensure_installed = vim.tbl_keys(servers),
    
            -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
            -- This setting has no relation with the `ensure_installed` setting.
            -- Can either be:
            --   - false: Servers are not automatically installed.
            --   - true: All servers set up via lspconfig are automatically installed.
            --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
            --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
            ---@type boolean
            automatic_installation = false,

            -- See `:h mason-lspconfig.setup_handlers()`
            ---@type table<string, fun(server_name: string)>?
            -- Manage handlers below
            -- handlers = nil,
        }

        mason_lspconfig.setup_handlers {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                }
            end
        }

    end
}
