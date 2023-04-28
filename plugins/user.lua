return {
  { "navarasu/onedark.nvim",    enabled = true },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      on_colors = function(colors)
        colors.comment = "#8294ba"
      end,
      on_highlights = function(hl, c)
        hl.Type = { fg = c.yellow, style = { italic = true } }
        hl["@type.builtin"] = { fg = c.yellow, style = { italic = false } }
      end
    },
    enabled = true
  },
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
    "David-Kunz/jester",
    opts = { cmd = "npx jest --silent -t '$result' -- $file" },
    event = { "BufEnter *.test.{tsx,ts,js,jsx}" }
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<A-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "nav next harpoon file" },
      { "<A-e>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "nav prev harpoon file" },
    }
  },
  { "ThePrimeagen/vim-be-good", event = { "VeryLazy" } },
  -- {
  --   "https://git.sr.ht/~nedia/auto-save.nvim",
  --   event = { "BufWinEnter" },
  --   opts = {
  --     events = { "BufLeave" },
  --     exclude_ft = { "neo-tree" },
  --   }
  -- }

}
