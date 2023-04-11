return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "typescript", "html" },
    autotag = { enable = true }
    -- autotag = {
    --   enable = true,
    --   filetypes = {
    --     'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
    --     'rescript',
    --     'css', 'lua', 'xml', 'php', 'markdown'
    --   },
    -- },
  }
}
