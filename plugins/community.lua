return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.editing-support.treej" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.pack.go" },
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
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
