return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    enabled = false,
  },
  {
    "maxmellon/vim-jsx-pretty",
    name = "vim-jsx-pretty",
    dependencies = { "HerringtonDarkholme/yats.vim", "yuezk/vim-js" },
    event = { "BufEnter *.{tsx,ts}" },
  },
  {
    "EtiamNullam/deferred-clipboard.nvim",
    opts = { fallback = "unnamedplus" },
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    dependencies = { "tpope/vim-repeat" },
    event = { "BufEnter" },
  },
  {
    -- Tag auto rename
    "AndrewRadev/tagalong.vim",
    event = { "BufEnter" },
  },
  {
    "gerazov/toggle-bool.nvim",
    event = { "BufEnter" },
    keys = {
      { "<C-t>", "<cmd>lua require('toggle-bool').toggle_bool()<cr>", desc = "Toggle boolean value" },
    },
  },
  {
    "heavenshell/vim-jsdoc",
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
  },
  {
    "matze/vim-move",
    event = "BufEnter",
  },
  {
    "jparise/vim-graphql",
    event = "BufEnter",
  },
}
