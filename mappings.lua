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
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bx"] = { "<cmd>bd<cr>", desc = "Close current buffer" },
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
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<A-t>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
    ["<AS-t>"] = { "<cmd>bprevious<cr>", desc = "Prev Buffer" },
    ["<leader>r"] = { "<cmd>e<cr>", desc = "Refresh file" },
    -- jester plugin
    ["<leader>j"] = { name = "Jester" },
    ["<leader>jt"] = { "<cmd>lua require'jester'.run()<cr>", desc = "Run test under cursor" },
    ["<leader>jf"] = { "<cmd>lua require'jester'.run_file()<cr>", desc = "Run test file" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
