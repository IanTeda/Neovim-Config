return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local builtin   = require("telescope.builtin")

      telescope.setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
        },
        extensions = {
          fzf = {},
        },
      })

      telescope.load_extension("fzf")

      local map = vim.keymap.set
      map("n", "<leader>ff", builtin.find_files,                { desc = "Find files" })
      map("n", "<leader>fg", builtin.live_grep,                 { desc = "Live grep" })
      map("n", "<leader>fb", builtin.buffers,                   { desc = "Buffers" })
      map("n", "<leader>fh", builtin.help_tags,                 { desc = "Help" })
      map("n", "<leader>fd", builtin.diagnostics,               { desc = "Diagnostics" })
      map("n", "<leader>fr", builtin.oldfiles,                  { desc = "Recent files" })
      map("n", "<leader>fs", builtin.lsp_workspace_symbols,     { desc = "Workspace symbols" })
      map("n", "<leader>gf", builtin.git_files,                 { desc = "Git files" })
      map("n", "<leader>fp", ":Telescope projects<CR>",         { desc = "Projects" })
    end,
  },
}
