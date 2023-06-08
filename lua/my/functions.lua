function Comment()
  local line = vim.api.nvim_get_current_line()
  local isCommented = string.sub(line, 0, 2) == "//"


  if isCommented == false then
    line = '//' .. line
  else
    line = string.sub(line, 3)
  end

  vim.api.nvim_set_current_line(line)
end

function Log()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")

  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  lines[1] = string.sub(lines[1], 1, s_end[3] - s_start[3] + 1)

  vim.api.nvim_input('j0i<BS><cr>')

  if vim.bo.filetype == 'rust' then
    lines[1] = "println!(\"† line " .. s_start[2] .. ' ' .. lines[1] .. ' {:?}\", ' .. lines[1] .. ');'
  else
    lines[1] = "console.log('† line " .. s_start[2] .. ' ' .. lines[1] .. "', " .. lines[1] .. ')'
  end


  vim.api.nvim_buf_set_text(
    0, s_start[2], 0, s_start[2], 0, lines)

  if vim.bo.filetype == 'rust' then
    vim.api.nvim_input('<Esc>f;a<cr><Esc>')
  else
    vim.api.nvim_input('<Esc>f)a<cr><Esc>')
  end

end



