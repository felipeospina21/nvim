local get_icon = require("astronvim.utils").get_icon
return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip" (plugin, opts) -- include the default astronvim config that calls the setup call
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } }
    end,
  },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   opts = {
  --     automatic_installation = true
  --     -- handlers = {
  --     --   firefox = function()
  --     --     local dap = require "dap"
  --     --     dap.adapters.firefox = {
  --     --       type = "executable",
  --     --       command = "node",
  --     --       args = {
  --     --         os.getenv('HOME') .. '/.local/share/nvim/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js' }
  --     --
  --     --     }
  --     --     dap.configurations.typescriptreact = {
  --     --       {
  --     --         name = 'Debug with Firefox',
  --     --         type = 'firefox',
  --     --         request = 'attach',
  --     --         reAttach = true,
  --     --         url = 'http://localhost:3000',
  --     --         webRoot = '${workspaceFolder}',
  --     --         firefoxExecutable = "/mnt/c/Program Files/Mozilla Firefox/firefox.exe"
  --     --       }
  --     --     }
  --     --   end
  --     --
  --     -- },
  --   },
  -- },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   config = function(_, opts)
  --     opts.source_selector = {
  --       winbar = true,
  --       content_layout = "center",
  --       sources = {
  --         { source = "filesystem",  display_name = get_icon "FolderClosed" .. " File" },
  --         { source = "buffers",     display_name = get_icon "DefaultFile" .. " Bufs" },
  --         { source = "diagnostics", display_name = get_icon "Diagnostic" .. " Diagnostic" },
  --       },
  --     }
  --     opts.filesystem = { filtered_items = { hide_dotfiles = false, hide_by_name = { ".git", ".github" } } }
  --     require('neo-tree').setup(opts)
  --     return opts
  --   end
  -- },
  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
