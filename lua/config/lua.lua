command {
    "LuaInvalidate",
    function(pattern) invalidate(pattern, true) end,
    nargs = 1
}

nmap { '<F2>', [[:LuaInvalidate ]], silent = false }
nmap { '<F3>', function()
    invalidate('.*', true)
    vim.cmd([[source $MYVIMRC]])
    print("reloaded")
end}
