return {
  { "navarasu/onedark.nvim", enabled = false },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    opts = {
      style = "moon",
      on_highlights = function(hl, c)
        -- hl.Function = { fg = "#c53b53", style = { italic = true } }
        -- hl["@keyword.function"] = { fg = "#b3ff99" }
        hl.Type = { fg = c.red, style = { italic = true } }
        hl.StorageClass = { fg = c.teal }
        hl["@type.builtin"] = { fg = c.yellow }
        -- hl["@type.parameter"] = { fg = "#b30f99" }
      end
    },
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
  }
}
