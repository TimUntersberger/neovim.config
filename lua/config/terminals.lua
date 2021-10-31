local shell = "pwsh"

if jit.os == "OSX" then
  shell = "zsh"
elseif jit.os == "UNIX" then
  shell = "bash"
end

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

  vim.fn.termopen({ shell })
end

nmap { '<c-s>v', string.format([[<cmd>vsplit <bar> e term://%s <cr>]], shell)}
nmap { '<c-s>s', string.format([[<cmd>split <bar> e term://%s <cr>]], shell)}
nmap { '<c-s>t', string.format([[<cmd> tabnew term://%s <cr>]], shell)}
nmap { '<c-s><c-s>', function()
  create_scratch()
end}
tmap { '<Esc>', '<C-\\><C-n>' }

autocmd {
    { 'TermOpen' },
    { '*' },
    function()
      vim.cmd "nnoremap <buffer> <c-w>q :bw!<cr>"
      vim.wo.nu = false
      vim.wo.rnu = false
    end
}
