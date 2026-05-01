return {
  {
    "folke/tokyonight.nvim",
    opts = function()
      local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
      local result = handle:read("*a")
      handle:close()
      local is_dark = result:match("Dark") ~= nil
      return {
        style = is_dark and "storm" or "day",
      }
    end,
  },
}
