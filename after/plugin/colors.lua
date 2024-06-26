function ColorMy(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  --rose-pine
  vim.cmd("hi MatchParen guibg=#fadcb1")

  --dap
  vim.cmd("hi DiffText guifg=#383a42 guibg=#a0a1a7")
  vim.cmd("hi DapUIThread guifg=#c633ff")
  vim.cmd("hi DapUIWatchesValue guifg=#c633ff")
  vim.cmd("hi DapUIBreakpointsInfo guifg=#c633ff")
  vim.cmd("hi DapUIBreakpointsCurrentLine guifg=#c633ff")
  vim.cmd("hi DapUIPlayPause guifg=#c633ff")
  vim.cmd("hi DapUIRestart guifg=#c633ff")
  vim.cmd("hi DapUIStoppedThread guifg=#005af5")
  vim.cmd("hi DapUILineNumber guifg=#005af5")
  vim.cmd("hi DapUIStepOver guifg=#005af5")
  vim.cmd("hi DapUIStepInto guifg=#005af5")
  vim.cmd("hi DapUIStepBack guifg=#005af5")
  vim.cmd("hi DapUIStepOut guifg=#005af5")
  vim.cmd("hi DapUIWinSelect ctermfg=Black guifg=#005af5 gui=bold")
end

ColorMy()
