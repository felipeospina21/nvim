return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "mxsdev/nvim-dap-vscode-js",       opts = { debugger_cmd = { "js-debug-adapter" }, adapters = { "pwa-node" } } },
    { "theHamsta/nvim-dap-virtual-text", config = true },
  },
  config = function()
    local dap = require "dap"

    local attach_node = {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    }

    local jest_current_file = {
      type = "node",
      request = "launch",
      name = "Jest: current file",
      program = "${workspaceFolder}/node_modules/.bin/jest",
      args = { "${fileBasenameNoExtension}", "--config", "jest.config.js" },
      console = "integratedTerminal",
      disableOptimisticBPs = true,
      windows = {
        program = "${workspaceFolder}/node_modules/jest/bin/jest"
      }
    }

    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      attach_node,
    }
    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        runtimeExecutable = "ts-node",
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
        resolveSourceMapLocations = {
          "${workspaceFolder}/dist/**/*.js",
          "${workspaceFolder}/**",
          "!**/node_modules/**",
        },
      },
      attach_node,
      jest_current_file,
    }
  end,
}
