-- :LspInto
local lsp_zero = require('lsp-zero')

local function is_valid_function_name(str)
    local pattern = "^[a-zA-Z_$][a-zA-Z_$0-9]*,$"
    return string.match(str, pattern) ~= nil
end

local function filter_list(options)
  local filtered_opts = {}

  for i,v in pairs(options.items) do
    local start = string.sub(v.text, 1, 4)

    if
      start ~= 'impo' and
      start ~= 'expo' and
      start ~= 'func' and
      is_valid_function_name(v.text) == false and
      v.text:match("^  " .. v.text .. "*,$") == nil
    then
      table.insert(filtered_opts, options.items[i])
    end
  end

  vim.fn.setloclist(0, {}, ' ', { items = filtered_opts })
  vim.api.nvim_command('lopen')
end

lsp_zero.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = true}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references(nil, { on_list=filter_list }) end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({
  PATH = "prepend"
})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

vim.filetype.add({
  extension = {
    templ = "templ"
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

cmp.setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  }
})

require'lspconfig'.html.setup{
  filetypes = { "html", "javascript" },
}
