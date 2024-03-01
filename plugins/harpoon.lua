local prefix = "<leader><leader>"
local term_string = vim.fn.exists "$TMUX" == 1 and "tmux" or "term"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱡀 " or ""
maps.n[prefix] = { desc = icon .. "Harpoon" }
require("astronvim.utils").set_mappings(maps)
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { prefix .. "a", function() require("harpoon"):list():append() end, desc = "Add file" },
      {
        prefix .. "e",
        function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
        desc = "Toggle quick menu",
      },
      {
        "<C-x>",
        function()
          vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
            local num = tonumber(input)
            if num then require("harpoon"):list():select(num) end
          end)
        end,
        desc = "Goto index of mark",
      },
      { "<C-p>", function() require("harpoon"):list():prev() end, desc = "Goto previous mark" },
      { "<C-n>", function() require("harpoon"):list():next() end, desc = "Goto next mark" },
      { "<A-n>", function() require("harpoon"):list():select(1) end, desc = "Goto harpoon 1" },
      { "<A-e>", function() require("harpoon"):list():select(2) end, desc = "Goto harpoon 2" },
      { "<A-i>", function() require("harpoon"):list():select(3) end, desc = "Goto harpoon 3" },
      { "<A-o>", function() require("harpoon"):list():select(4) end, desc = "Goto harpoon 4" },
      { prefix .. "m", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },
      {
        prefix .. "t",
        function()
          vim.ui.input({ prompt = term_string .. " window number: " }, function(input)
            local num = tonumber(input)
            if num then require("harpoon").term.gotoTerminal(num) end
          end)
        end,
        desc = "Go to " .. term_string .. " window",
      },
    },
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { harpoon = true } },
  },
}
-- return {
--   "ThePrimeagen/harpoon",
--   branch = "harpoon2",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   keys = {
--     { "<A-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "nav next harpoon file" },
--     { "<A-e>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "nav prev harpoon file" },
--     { "<A-m>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoon menu" },
--     { "<A-,>", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "harpoon add file" },
--   },
-- }
