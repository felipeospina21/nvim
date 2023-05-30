local utils = require "astronvim.utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "tsserver", "cssls", "dotls", "html", "jsonls", "marksman", "yamlls" },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "prettierd", "eslint_d" })

      if not opts.handlers then opts.handlers = {} end

      opts.handlers.prettierd = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.formatting.prettierd.with {
          condition = function(util)
            return util.root_has_file "package.json"
                or util.root_has_file ".prettierrc"
                or util.root_has_file ".prettierrc.json"
                or util.root_has_file ".prettierrc.js"
          end,
        })
      end

      opts.handlers.eslint_d = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.eslint_d.with {
          condition = function(util)
            return util.root_has_file "package.json"
                or util.root_has_file ".eslintrc.json"
                or util.root_has_file ".eslintrc.js"
          end,
        })
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
