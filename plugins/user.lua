return {
  { "navarasu/onedark.nvim", enabled = false },
  {
    "maxmellon/vim-jsx-pretty",
    name = "vim-jsx-pretty",
    dependencies = { "HerringtonDarkholme/yats.vim", "yuezk/vim-js" },
    event = { "BufEnter *.{tsx,ts}" },
  },
  {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = true,
    event = "BufRead package.json",
  },
  {
    "EtiamNullam/deferred-clipboard.nvim",
    opts = { fallback = "unnamedplus" }
  },
  {
    "tpope/vim-surround",
    dependencies = { "tpope/vim-repeat" },
    event = { "BufEnter" }
  },
  {
    -- Tag auto rename
    "AndrewRadev/tagalong.vim",
    event = { "BufEnter" }
  }
}
