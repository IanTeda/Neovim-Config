return {
  {
    "saghen/blink.cmp",
    -- lazy = false required so lsp.lua can call get_lsp_capabilities() at BufReadPre
    lazy = false,
    version = "*",
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "buffer", "snippets" },
      },
      signature = {
        enabled = true,
        window  = { border = "rounded" },
      },
      completion = {
        documentation = {
          auto_show = true,
          window    = { border = "rounded" },
        },
      },
      fuzzy = {
        frecency  = { enabled = true },
        proximity = { enabled = true },
      },
    },
  },
}
