-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
local get_icon = utils.get_icon
return {
  -- first key is the mode
  n = {
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },

    -- custom
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<A-t>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
    ["<AS-t>"] = { "<cmd>bprevious<cr>", desc = "Prev Buffer" },
    ["<leader>r"] = { "<cmd>e<cr>", desc = "Refresh file" },
    ["<A-Up>"] = { "<cmd>m .-2<CR>", desc = "Move line up" },
    ["<A-Down>"] = { "<cmd>m .+1<CR>", desc = "Move line down" },
    ["<AS-Up>"] = { "VyP", desc = "Copy/Paste line up" },
    ["<AS-Down>"] = { "Vyp", desc = "Copy/Paste line down" },

    ["<leader>N"] = { name = " Neotest" },
    ["<leader>H"] = { name = " Http" },
    ["<leader>P"] = { name = " Package.json" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
