return {
  -- Keymap hints popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Diagnostics list (v3 API)
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>",                        desc = "Workspace diagnostics" },
      { "<leader>xd", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",           desc = "Document diagnostics" },
      { "<leader>xq", "<CMD>Trouble qflist toggle<CR>",                             desc = "Quickfix list" },
      { "gR",         "<CMD>Trouble lsp_references toggle<CR>",                     desc = "LSP references" },
    },
  },

  -- TODO / HACK / BUG comment highlights
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- Terminal toggle
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { [[<C-\>]], "<CMD>ToggleTerm<CR>", desc = "Toggle terminal" },
      { "<leader>gg", desc = "Lazygit" },
    },
    config = function()
      require("toggleterm").setup({
        open_mapping    = [[<C-\>]],
        direction       = "float",
        float_opts      = { border = "rounded" },
        shade_terminals = false,
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit  = Terminal:new({
        cmd       = "lazygit",
        direction = "float",
        float_opts = { border = "rounded" },
        hidden    = true,
      })

      vim.keymap.set("n", "<leader>gg", function() lazygit:toggle() end, { desc = "Lazygit" })
    end,
  },

  -- Project root detection (pairs with telescope <leader>fp)
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns          = { ".git", "Cargo.toml", "flake.nix", "shell.nix" },
        silent_chdir      = true,
      })
      require("telescope").load_extension("projects")
    end,
  },
}
