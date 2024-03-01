return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  {
    "rose-pine",
    opts = {
      variant = "moon",
      highlight_groups = {
        IndentBlanklineChar = { fg = "surface", nocombine = true },
        -- NotifyBackground = { bg = "surface" },
        -- IndentBlanklineSpaceChar = { fg = "surface", nocombine = true },
        -- IndentBlanklineSpaceCharBlankline = { fg = "surface", nocombine = true },
      },
    },
  },
}
