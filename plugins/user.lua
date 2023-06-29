local utils = require "astronvim.utils"

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
    "jose-elias-alvarez/typescript.nvim",
    init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "tsserver") end,
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    opts = function() return { server = require("astronvim.utils.lsp").config "tsserver" } end,
  },
  {
    "sagarrakshe/toggle-bool",
    event = { "BufEnter" },
    keys = {
      { "<C-t>", "<cmd>ToggleBool<cr>", desc = "Toggle boolean value" },
    },
  },
}
