local telescope = require('telescope')
telescope.setup {
  extentions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "respect_case",
    }
  }
}

require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>s', function()
  local search_string = vim.fn.input("Grep🔍 ▶")
  if search_string ~= "" then
    builtin.grep_string({
      search = search_string,
      case_mode = "respect_case"
    })
  end
end)
-- vim.keymap.set("n", "<leader>vrr", ": Telescope lsp_references<CR>")
require("telescope").load_extension("git_worktree")
