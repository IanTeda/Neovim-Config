return {
  {
    "mfussenegger/nvim-dap",
    cmd = "DapToggleBreakpoint",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
      { "<F5>",        function() require("dap").continue() end,                        desc = "DAP continue" },
      { "<F10>",       function() require("dap").step_over() end,                       desc = "DAP step over" },
      { "<F11>",       function() require("dap").step_into() end,                       desc = "DAP step into" },
      { "<F12>",       function() require("dap").step_out() end,                        desc = "DAP step out" },
      { "<leader>db",  function() require("dap").toggle_breakpoint() end,               desc = "Toggle breakpoint" },
      { "<leader>dB",  function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,                                                                             desc = "Conditional breakpoint" },
      { "<leader>du",  function() require("dapui").toggle() end,                        desc = "Toggle DAP UI" },
    },
    config = function()
      local dap    = require("dap")
      local dapui  = require("dapui")

      require("nvim-dap-virtual-text").setup({})

      dapui.setup({
        icons = { expanded = "", collapsed = "", current_frame = "" },
        controls = { enabled = true },
      })

      -- Open/close dap-ui automatically with debug sessions
      dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"]  = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end

      -- codelldb adapter (Rust / C / C++) — binary provided by Nix lldb package
      dap.adapters.codelldb = {
        type    = "server",
        port    = "${port}",
        executable = {
          command = vim.fn.exepath("codelldb"),
          args    = { "--port", "${port}" },
        },
      }

      dap.configurations.rust = {
        {
          name    = "Launch",
          type    = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd            = "${workspaceFolder}",
          stopOnEntry    = false,
        },
      }
    end,
  },
}
