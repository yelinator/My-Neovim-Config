return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Debug continue" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Debug step into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Debug step over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Debug step out" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Debug UI" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("nvim-dap-virtual-text").setup()
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local python = vim.fn.exepath("python3")
      if python == "" then
        python = "python"
      end
      require("dap-python").setup(python)
    end,
  },
}
