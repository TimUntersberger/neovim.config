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

command {
  "Selene",
  function(...)
    local args = {...}
    local default_config = {
      pattern = "./lua",
      config = "./selene/config.toml"
    }
    local config = {}

    for _,val in ipairs(args) do
      local tokens = vim.split(val, "=")
      if #tokens == 2 then
        config[tokens[1]] = tokens[2]
      end
    end

    config = vim.tbl_extend("force", default_config, config)

    if args[1] == "debug" then
      inspect(config)
    end

    vim.cmd(string.format("cexpr system('selene --display-style=Quiet --config %s %s')", config.config, config.pattern))
    vim.cmd "copen"
  end,
  nargs = "*"
}
