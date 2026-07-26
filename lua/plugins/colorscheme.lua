local function system_style()
  local out = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
  if out:find("prefer-dark") then
    return "night"
  elseif out:find("prefer-light") then
    return "day"
  end
  return vim.o.background == "light" and "day" or "night"
end

return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = system_style(),
      transparent = false,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}
