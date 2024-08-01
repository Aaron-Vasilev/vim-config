local Worktree = require("git-worktree")

-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Create then
    local cwd_node_modules_path = vim.fn.getcwd() .. '/node_modules '
    local link_node_modules_path = vim.fn.getcwd() .. '/' .. metadata.path .. '/node_modules'

    local result = vim.fn.mkdir(link_node_modules_path, 'p')

    if result == 1 then
      vim.cmd('!ln -s ' .. cwd_node_modules_path  .. link_node_modules_path)
    end
  end
end)
