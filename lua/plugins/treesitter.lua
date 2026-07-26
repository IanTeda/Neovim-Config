return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter").install({
        "nix", "lua", "bash", "vim", "vimdoc", "markdown",
        "beancount", "rust", "toml", "json", "yaml",
        "python", "typescript", "html",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          if pcall(vim.treesitter.start) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move  = { set_jumps = true },
      })

      local select = require("nvim-treesitter-textobjects.select")
      for key, query in pairs({
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      }) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(query, "textobjects")
        end)
      end

      local move = require("nvim-treesitter-textobjects.move")
      for method, mappings in pairs({
        goto_next_start     = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
        goto_next_end       = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
        goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
        goto_previous_end   = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
      }) do
        for key, query in pairs(mappings) do
          vim.keymap.set("n", key, function()
            move[method](query, "textobjects")
          end)
        end
      end
    end,
  },
}
