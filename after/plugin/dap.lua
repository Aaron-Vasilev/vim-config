vim.keymap.set("n", "<F5>", ": lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F7>", ": lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F8>", ": lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F9>", ": lua require'dap'.step_out()<CR>")
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

require("dap-vscode-js").setup({
  debugger_path = "/Users/avasilev/utils/vscode-js-debug",
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'node-terminal' }, -- which adapters to register in nvim-dap
--   debugger_cmd = "rm -rf .next/ && pnpm next dev -p 3000",
--   log_file_path = "/Users/avasilev/t.log", -- Path for file logging
--   log_file_level = true, -- Logging level for output to file. Set to false to disable file logging.
--   log_console_level = vim.log.levels.DEBUG -- Logging level for output to console. Set to false to disable console output.
})

for _, lang in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
  dap.configurations[lang] = {
--     {
--       name = "Launch file",
--       type = "go",
--       request = "launch",
--       env = {
--         USER_NAME = "REPLACE_FROM_SECRETS_MANAGER",
--         USER_PASS = "REPLACE_FROM_SECRETS_MANAGER",
--         BASE_URL = "https://dev.liminal.security"
--       },
--       mode = "debug",
--       program = "${file}"
--     },
--     {
--       name = "Launch file",
--       type = "node-terminal",
--       request = "launch",
--       cwd = "${workspaceFolder}",
--       program = "${file}"
--     },
    {
      name = "Next.js: debug server-side",
      type = "pwa-node",
      request = "attach",
      cwd = "${workspaceFolder}",
      processId = require'dap.utils'.pick_process,
      command = "rm -rf .next/ && pnpm next dev -p 3000"
    },
--     {
--       name = "Next.js: debug server-side",
--       type = "node-terminal",
--       request = "launch",
--       cwd = "${workspaceFolder}",
--       command = "rm -rf .next/ && pnpm next dev -p 3000"
--     },
     {
       name = "Next.js: debug client-side",
       type = "pwa-chrome",
       request = "launch",
       cwd = "${workspaceFolder}",
       url = "http://localhost:3000"
     },
     {
       name = "Next.js: debug full stack",
       type = "node-terminal",
       request = "launch",
       command = "pnpm dev",
       cwd = "${workspaceFolder}",
       console = "integratedTerminal",
       serverReadyAction = {
         pattern = "started server on .+, url: (https?://.+)",
         uriFormat = "%s",
         action = "debugWithChrome"
       }
     }
  }
end
