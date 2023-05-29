local utils = require "astronvim.utils"

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    config.sources = {
      utils.list_insert_unique(config.sources, require "typescript.extensions.null-ls.code-actions")
    }
    return config
  end,
}
