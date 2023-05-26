return {
  "folke/tokyonight.nvim",
  opts = {
    style = "moon",
    on_colors = function(colors)
      colors.comment = "#8294ba"
      colors.bg = "#212338"
    end,
    on_highlights = function(hl, c)
      hl.Type = { fg = c.yellow, style = { italic = true } }
      hl["@type.builtin"] = { fg = c.yellow, style = { italic = false } }
    end
  },
  enabled = true
}
