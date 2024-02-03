return {
  "mfussenegger/nvim-dap",
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

    vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>", { desc = "Continue Breakpoint" })
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>", { desc = "Terminate the debugger" })
    vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>", { desc = "Step Over the breakpoint" })
  end,
}
