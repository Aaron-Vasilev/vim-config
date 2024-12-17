vim.g.tmux_navigator_no_mappings = 1 -- Disable default mappings from the plugin

-- Define custom mappings to match your tmux settings
vim.api.nvim_set_keymap('n', '<C-w>h', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>j', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>k', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>l', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })
