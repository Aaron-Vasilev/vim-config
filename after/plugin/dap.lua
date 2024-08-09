vim.keymap.set("n", "<F5>", ": lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F7>", ": lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F9>", ": lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F8>", ": lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ": lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ": lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ": lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ": lua require'dap'.repl.open()<CR>")

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

dapui.setup()
require('nvim-dap-virtual-text').setup()

require('dap-go').setup ({
  on_attach = function ()
  end
})

dap.adapters['pwa-node'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = { '/Users/avasilev/utils/js-debug/src/dapDebugServer.js', '${port}' },
  },
}

for _, lang in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
  dap.configurations[lang] = {
    {
      name = 'Next.js: debug server-side',
      type = 'pwa-node',
      request = 'attach',
      port = 9231,
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
      cwd = '${workspaceFolder}',
    },
  }
end
