-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },

    -- custom
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<A-t>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
    ["<A-b>"] = { "<cmd>Telescope buffers<cr>", desc = "Buffers list" },
    ["<A-Up>"] = { "<cmd>m .-2<CR>", desc = "Move line up" },
    ["<A-Down>"] = { "<cmd>m .+1<CR>", desc = "Move line down" },
    ["<AS-t>"] = { "<cmd>bprevious<cr>", desc = "Prev Buffer" },
    ["<AS-Up>"] = { "VyP", desc = "Copy/Paste line up" },
    ["<AS-Down>"] = { "Vyp", desc = "Copy/Paste line down" },
    ["<leader>r"] = { "<cmd>e<cr>", desc = "Refresh file" },
    ["<leader>fj"] = { "<cmd>Telescope jumplist<cr>", desc = "Find jumplist" },
    ["<leader>fs"] = { "<cmd>Telescope spell_suggest<cr>", desc = "Spell suggestion" },
    ["<leader>f/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer fzf" },

    ["<leader>N"] = { name = " Neotest" },
    ["<leader>H"] = { name = " Http" },
    ["<leader>P"] = { name = " Package.json" },
    -- ["<leader>T"] = { name = " Two-slash" },
  },
  v = {
    ["<AS-Up>"] = { "yP", desc = "Copy/Paste line up" },
    ["<AS-Down>"] = { "yp", desc = "Copy/Paste line down" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
