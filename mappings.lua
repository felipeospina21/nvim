-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
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
    -- tables with the `name` key will be registered with which-key if it's installed

    -- custom
    ["<leader>b"] = { name = "Buffers" },
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<leader><Tab>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
    ["<leader><S-Tab>"] = { "<cmd>bprevious<cr>", desc = "Prev Buffer" },
    ["<leader>r"] = { "<cmd>e<cr>", desc = "Refresh file" },
    -- jester plugin
    ["<leader>j"] = { name = "Jester" },
    ["<leader>jt"] = { "<cmd>lua require'jester'.run()<cr>", desc = "Run test under cursor" },
    ["<leader>jf"] = { "<cmd>lua require'jester'.run_file()<cr>", desc = "Run test file" },
    -- harpoon plugin
    ["<leader>H"] = { name = "Harpoon" },
    ["<leader>Hm"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle menu" },
    ["<leader>Ha"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add file" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
