local utils = require "astronvim.utils"

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "mxsdev/nvim-dap-vscode-js",
      opts = {
        -- debugger_cmd = { "js-debug-adapter" },
        -- debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome", "node-terminal" },
      },
    },
    { "theHamsta/nvim-dap-virtual-text", config = true },
  },
  config = function()
    local dap = require "dap"

    local js_based_languages = { "typescript", "javascript", "typescriptreact" }

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          require("mason-registry").get_package("js-debug-adapter"):get_install_path()
            .. "/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    dap.adapters["pwa-chrome"] = {
      type = "executable",
      command = "node",
      -- args = { os.getenv "HOME" .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js" },
      args = {
        require("mason-registry").get_package("chrome-debug-adapter"):get_install_path() .. "/out/src/chromeDebug.js",
      },
    }

    dap.adapters.firefox = {
      type = "executable",
      command = "node",
      args = {
        require("mason-registry").get_package("firefox-debug-adapter"):get_install_path() .. "/dist/adapter.bundle.js",
      },
    }

    for _, language in ipairs(js_based_languages) do
      local lang_config = {
        {
          name = "Launch file",
          type = "pwa-node",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          name = "Attach",
          type = "pwa-node",
          request = "attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          name = 'Start Chrome with "localhost"',
          type = "pwa-chrome",
          request = "launch",
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
        },
        {
          name = "Debug with Firefox",
          type = "firefox",
          request = "launch",
          reAttach = true,
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          firefoxExecutable = "/usr/bin/firefox",
        },
      }

      if not dap.configurations[language] then
        dap.configurations[language] = lang_config
      else
        utils.extend_tbl(dap.configurations[language], lang_config)
      end
    end
  end,
}
