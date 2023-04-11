return {
  { "rose-pine/neovim",      name = "rose-pine",  opts = { variant = "moon" }, enabled = false },
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    opts = { style = "dark" },
    enabled = false
  },
  { "folke/tokyonight.nvim", name = "tokyonight", opts = { style = "storm" } },
  {
    "maxmellon/vim-jsx-pretty",
    name = "vim-jsx-pretty",
    dependencies = { "HerringtonDarkholme/yats.vim", "yuezk/vim-js" },
    event = { "BufEnter *.tsx", "BufEnter *.ts" },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { filetypes = { "tsx", "typescriptreact" } }
  },
}
