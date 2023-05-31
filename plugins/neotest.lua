return {
  "nvim-neotest/neotest",
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace "neotest"
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup {
      -- your neotest config here
      adapters = {
        require "neotest-jest"
        -- require("neotest-jest")({
        --   strategy_config = function()
        --     return {
        --       dap = {
        --         name = "Debug Jest Tests",
        --         type = "pwa-node",
        --         request = "launch",
        --         -- args = { unpack(command, 2) },
        --         -- runtimeExecutable = command[1],
        --         console = "integratedTerminal",
        --         internalConsoleOptions = "neverOpen",
        --         rootPath = "${workspaceFolder}",
        --         cwd = "${workspaceFolder}",
        --         -- type = 'pwa-node',
        --         -- request = 'launch',
        --         -- cwd = vim.fn.getcwd(),
        --         -- runtimeArgs = { '--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file' },
        --         args = { '--no-cache' },
        --         -- sourceMaps = false,
        --         -- protocol = 'inspector',
        --         -- skipFiles = { '<node_internals>/**/*.js' },
        --         -- console = 'integratedTerminal',
        --         port = 9229,
        --         disableOptimisticBPs = true
        --       }
        --     }
        --   end
        -- }),
      },
    }
  end,
  ft = { "typescriptreact", "typescript" },
  dependencies = {
    "nvim-neotest/neotest-jest",
  },
  keys = {
    { "<leader>Nr", "<cmd>lua require('neotest').run.run()<cr>",                   desc = "Run nearest test" },
    { "<leader>Nf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run file test" },
    { "<leader>Nk", "<cmd>lua require('neotest').run.stop()<cr>",                  desc = "Stop nearest test" },
    { "<leader>No", "<cmd>lua require('neotest').output.open({enter=true})<cr>",   desc = "Open test output" },
    { "<leader>Np", "<cmd>lua require('neotest').output_panel.toggle()<cr>",       desc = "Toggle output panel" },
    { "<leader>Ns", "<cmd>lua require('neotest').summary.toggle()<cr>",            desc = "Toggle summary" },
  }
}
