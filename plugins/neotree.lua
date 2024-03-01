return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window = {
      width = 50,
      mappings = {
        ["<space>"] = false, -- disable space until we figure out which-key disabling
        ["[b"] = "prev_source",
        ["]b"] = "next_source",
        o = "open",
        O = "system_open",
        h = "parent_or_close",
        l = "child_or_open",
        Y = "copy_selector",
      },
    }
  end,
}
