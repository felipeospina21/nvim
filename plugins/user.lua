return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  "windwp/nvim-autopairs",
  { "catppuccin/nvim",  name = "catppuccin", enabled = false },
  { "rose-pine/neovim", name = "rose-pine",  opts = { variant = "moon" }, enabled = false },
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
  }
}
