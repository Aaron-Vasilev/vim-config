function ColorMy(color)
  color = color or "onehalflight"
  vim.cmd.colorscheme(color)
  vim.cmd("hi DiffText guifg=#383a42 guibg=#a0a1a7") 
end

ColorMy()
