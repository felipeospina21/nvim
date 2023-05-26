return {
  { "navarasu/onedark.nvim", enabled = false },
  {
    "maxmellon/vim-jsx-pretty",
    name = "vim-jsx-pretty",
    dependencies = { "HerringtonDarkholme/yats.vim", "yuezk/vim-js" },
    event = { "BufEnter *.{tsx,ts}" },
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
    "AndrewRadev/tagalong.vim",
    event = { "BufEnter" }
  }
}
