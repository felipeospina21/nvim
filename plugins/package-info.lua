return {
  "vuki656/package-info.nvim",
  requires = "MunifTanjim/nui.nvim",
  config = true,
  event = "BufRead package.json",
  keys = {
    { "<leader>Ps", "<cmd>lua require('package-info').show({ force = true })<cr>", desc = "Show outdated packages" },
    { "<leader>Pd", "<cmd>lua require('package-info').delete()<cr>",               desc = "Remove package" },
    { "<leader>Pu", "<cmd>lua require('package-info').update()<cr>",               desc = "Update package" },
    { "<leader>Pi", "<cmd>lua require('package-info').install()<cr>",              desc = "Install package" },
    { "<leader>Pp", "<cmd>lua require('package-info').change_version()<cr>",       desc = "Pick package version" },
  }

}
