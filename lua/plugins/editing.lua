return {
  -- Auto-close brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Comment toggling (gcc / gc)
  {
    "numToStr/Comment.nvim",
    keys = { "gcc", "gc" },
    opts = {},
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua  = { "stylua" },
        rust = { "rustfmt" },
        nix  = { "nixfmt" },
        sh   = { "shfmt" },
        bash = { "shfmt" },
      },
      format_on_save = {
        timeout_ms   = 500,
        lsp_fallback = true,
      },
    },
  },

  -- Indent scope visualisation
  {
    "echasnovski/mini.indentscope",
    event = "BufReadPost",
    version = "*",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      -- Disable in certain buffers
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "alpha", "dashboard", "help", "lazy", "mason", "notify", "toggleterm", "trouble" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
