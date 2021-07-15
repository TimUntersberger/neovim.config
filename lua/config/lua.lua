command {
    "LuaInvalidate",
    function(pattern) invalidate(pattern, true) end,
    nargs = 1
}

nmap { '<F2>', [[:LuaInvalidate ]], silent = false }
local pattern = ""
nmap { '<F3>', function()
  local input = vim.fn.input {
    prompt = "Module: ",
    default = pattern,
    cancelreturn = "__CANCEL__"
  }
  if input ~= "__CANCEL__" then
    pattern = input
    invalidate(pattern, true)
    vim.cmd([[source $MYVIMRC]])
  end
end}
nmap { '<F4>', [[<cmd>luafile %<cr>]], silent = false }
