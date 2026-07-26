return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    default_file_explorer = true,
    columns = { "icon", "permissions", "size", "mtime" },
    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = "rounded",
    },
    view_options = {
      show_hidden = false,
    },
    keymaps = {
      ["<C-s>"] = "actions.save",
      ["<C-h>"] = "actions.toggle_hidden",
      ["g?"]    = "actions.show_help",
    },
  },
  keys = {
    { "-",          "<CMD>Oil<CR>", desc = "Open parent directory" },
    { "<leader>e",  "<CMD>Oil<CR>", desc = "Open file explorer" },
  },
}
