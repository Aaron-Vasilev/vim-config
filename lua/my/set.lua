vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 5
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.smartcase = false
vim.opt.ignorecase = false
vim.opt.undodir = os.getenv("HOME" .. "/.vim/undodir")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  command = "resize 35",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    command = "setlocal noexpandtab shiftwidth=4 softtabstop=0 tabstop=4",
})
