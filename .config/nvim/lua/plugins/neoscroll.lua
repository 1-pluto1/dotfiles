return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        hide_cursor = false,
        stop_eof = true,
        easing = "quadratic",
        duration_multiplier = 0.30,
      })
    end,
  },
}
