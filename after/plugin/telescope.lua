local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  local search_string = vim.fn.input("Grep > ")
  if search_string ~= "" then
    builtin.grep_string({ search = search_string })
  end

end)
