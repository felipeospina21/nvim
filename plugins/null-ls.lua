local utils = require "astronvim.utils"

return {
  -- {
  --   "jose-elias-alvarez/typescript.nvim",
  --   init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "tsserver") end,
  --   ft = {
  --     "typescript",
  --     "typescriptreact",
  --     "javascript",
  --     "javascriptreact",
  --   },
  --   opts = function() return { server = require("astronvim.utils.lsp").config "tsserver" } end,
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, config)
      config.sources = {
        -- utils.list_insert_unique(config.sources, require "typescript.extensions.null-ls.code-actions")
      }
      return config
    end
  },
}
