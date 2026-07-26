return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      local lspconfig   = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Diagnostic display
      vim.diagnostic.config({
        virtual_text = false,
        signs        = true,
        underline    = true,
        float        = { border = "rounded" },
      })

      -- Buffer-local keymaps on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end

          map("gd",          vim.lsp.buf.definition,      "Go to definition")
          map("gr",          vim.lsp.buf.references,      "Go to references")
          map("gI",          vim.lsp.buf.implementation,  "Go to implementation")
          map("K",           vim.lsp.buf.hover,           "Hover documentation")
          map("<leader>rn",  vim.lsp.buf.rename,          "Rename symbol")
          map("<leader>ca",  vim.lsp.buf.code_action,     "Code action")
          map("<leader>cf",  function()
            require("conform").format({ async = true, lsp_fallback = true })
          end, "Format buffer")
          map("[d", function() vim.diagnostic.goto_prev({ float = { border = "rounded" } }) end, "Previous diagnostic")
          map("]d", function() vim.diagnostic.goto_next({ float = { border = "rounded" } }) end, "Next diagnostic")
          map("<leader>cd",  function() vim.diagnostic.open_float() end, "Diagnostic float")
        end,
      })

      -- Servers (binaries provided by Nix extraPackages)
      lspconfig.nil_ls.setup({
        capabilities = capabilities,
        settings = {
          ["nil"] = {
            formatting = { command = { "nixfmt" } },
          },
        },
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime  = { version = "LuaJIT" },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
          },
        },
      })

      lspconfig.bashls.setup({ capabilities = capabilities })

      lspconfig.beancount.setup({
        capabilities = capabilities,
        init_options = { journal_file = "" },
      })

      -- rust_analyzer is intentionally omitted — handled by rustaceanvim
    end,
  },
}
