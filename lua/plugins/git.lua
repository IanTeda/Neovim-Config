return {
  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
      },
    },
  },

  -- Git commands via :Git
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      { "<leader>gb", ":Git blame<CR>",  desc = "Git blame" },
      { "<leader>gs", ":Git<CR>",        desc = "Git status" },
    },
  },
}
