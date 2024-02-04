return {
  "mfussenegger/nvim-dap",
  event = { "BufReadPre", "BufWritePre" },
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    require("dapui").setup()
    -- TODO: REQUIRE AND SETUP LANGUAGE SPECIFIC DEBUGGER HERE...
    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
