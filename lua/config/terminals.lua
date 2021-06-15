local function create_scratch(height, width)
  height = height or 30
  width = width or 120

  local top = math.floor(((vim.o.lines - height) / 2) - 1)
  local left = math.floor((vim.o.columns - width) / 2)

  local scratch_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_keymap(scratch_buf, "n", "<esc>", ":close<cr>", {})
  vim.api.nvim_buf_set_keymap(scratch_buf, "n", "q", ":close<cr>", {})
  vim.api.nvim_buf_set_keymap(scratch_buf, "t", "<esc>", "<C-\\><C-n>", {})

  local win = vim.api.nvim_open_win(scratch_buf, true, {
    relative = "editor",
    border = "single",
    style = "minimal",
    height = height,
    width = width,
    row = top,
    col = left
  })

  vim.fn.termopen({ "pwsh" })
end

nmap { '<c-s>v', [[<cmd>vsplit <bar> e term://pwsh <cr>]]}
nmap { '<c-s>s', [[<cmd>split <bar> e term://pwsh <cr>]]}
nmap { '<c-s><c-s>', function()
  create_scratch()
end}
tmap { '<Esc>', '<C-\\><C-n>' }

autocmd {
    { 'TermOpen' },
    { '*' },
    function()
        vim.wo.nu = false
        vim.wo.rnu = false
    end
}
