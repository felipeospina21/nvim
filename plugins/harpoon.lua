return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<A-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>",          desc = "nav next harpoon file" },
    { "<A-e>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",          desc = "nav prev harpoon file" },
    { "<A-m>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoon menu" },
    { "<A-,>", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "harpoon add file" },
  }
}
