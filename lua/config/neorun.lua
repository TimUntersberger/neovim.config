command { "Run", function(...)
  local args = {...}
  local buf = vim.api.nvim_create_buf(true, false)
  local term
  vim.api.nvim_buf_call(buf, function()
    term = vim.fn.termopen(table.concat(args, " "))
  end)
  local win = vim.api.nvim_open_win(buf, true)
end, nargs="*" }
