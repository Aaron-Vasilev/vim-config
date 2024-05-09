function CommentLine()
  local line = vim.api.nvim_get_current_line()
  local first_symbols = string.sub(line, 0, 2)
  local is_commented = first_symbols == "//" or first_symbols == "--"

  if is_commented == false then
    if vim.bo.filetype == 'lua' then
      line = '-- ' .. line
    else
      line = '// ' .. line
    end
  else
    line = string.sub(line, 4)
  end

  vim.api.nvim_set_current_line(line)
end

function CommentBlock()
  local vstart = vim.fn.getpos("'<")
  local vend = vim.fn.getpos("'>")
  local line_start = vstart[2]
  local line_end = vend[2]
  local lines = vim.fn.getline(line_start,line_end)
  local first_symbols = string.sub(lines[1], 0, 2)
  local is_commented = first_symbols == "//" or first_symbols == "--"

  for k in pairs(lines) do
    if is_commented == false then
      if vim.bo.filetype == 'lua' then
        lines[k] = '-- ' .. lines[k]
      else
        lines[k] = '// ' .. lines[k]
      end
    else
      lines[k] = string.sub(lines[k], 4)
    end

  end

  vim.api.nvim_buf_set_lines(0, line_start - 1, line_end, false, lines)

end

function Log()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local filetype = vim.bo.filetype

  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  lines[1] = string.sub(lines[1], 1, s_end[3] - s_start[3] + 1)

  vim.api.nvim_input('j0i<BS><cr>')

  if filetype == 'rust' then
    lines[1] = "println!(\"✡️  line " .. s_start[2] .. ' ' .. lines[1] .. ' {:?}\", ' .. lines[1] .. ');'
  elseif filetype == 'go' or filetype == 'templ' then
    lines[1] = "fmt.Println(\"✡️  line " .. s_start[2] .. ' ' .. lines[1] .. '", ' .. lines[1] .. ')'
  else
    lines[1] = "console.log('✡️  line " .. s_start[2] .. ' ' .. lines[1] .. "', " .. lines[1] .. ')'
  end

  vim.api.nvim_buf_set_text(0, s_start[2], 0, s_start[2], 0, lines)

  if vim.bo.filetype == 'rust' then
    vim.api.nvim_input('<Esc>f;a<cr><Esc>')
  else
    vim.api.nvim_input('<Esc>f)a<cr><Esc>')
  end

end

function Dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. Dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

