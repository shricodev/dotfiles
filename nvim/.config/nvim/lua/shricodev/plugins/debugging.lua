return {
  'mfussenegger/nvim-dap',
  keys = {
    {
      '<leader>dt',
      ':DapToggleBreakpoint<CR>',
      desc = 'Toggle breakpoint',
    },
    {
      '<leader>dc',
      ':DapContinue<CR>',
      desc = 'Continue Breakpoint',
    },
    {
      '<leader>dx',
      ':DapTerminate<CR>',
      desc = 'Terminate the debugger',
    },
    {
      '<leader>do',
      ':DapStepOver<CR>',
      desc = 'Step Over the breakpoint',
    },
  },
  dependencies = {
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    require('dapui').setup()
    -- TODO: REQUIRE AND SETUP LANGUAGE SPECIFIC DEBUGGER HERE...
    local dap, dapui = require 'dap', require 'dapui'
    -- Use this symbol for visualizing a breakpoint.
    vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

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
