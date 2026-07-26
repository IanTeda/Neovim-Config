return {
  -- Rust LSP + tools (replaces rust_tools.nvim)
  {
    "mrcjkb/rustaceanvim",
    ft = "rust",
    version = "^5",
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = { auto_focus = true },
        },
        server = {
          capabilities = require("blink.cmp").get_lsp_capabilities(),
          on_attach = function(_, bufnr)
            local map = function(keys, cmd, desc)
              vim.keymap.set("n", keys, cmd, { buffer = bufnr, desc = desc })
            end
            map("<leader>rh", function() vim.cmd.RustLsp("hover actions") end,  "Rust hover actions")
            map("<leader>rc", function() vim.cmd.RustLsp("codeAction") end,     "Rust code action")
          end,
        },
        dap = {
          adapter = {
            type    = "executable",
            command = vim.fn.exepath("lldb-dap"),
            name    = "lldb",
          },
        },
      }
    end,
  },

  -- Cargo.toml dependency UI
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)

      vim.api.nvim_create_autocmd("BufRead", {
        pattern = "Cargo.toml",
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end
          map("<leader>ct", crates.toggle,          "Crates toggle")
          map("<leader>cu", crates.update_crate,    "Crates update")
          map("<leader>ca", crates.show_crate_popup,"Crates actions")
        end,
      })
    end,
  },
}
