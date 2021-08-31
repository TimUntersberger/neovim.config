command {
  "CargoBuild",
  function(...)
    local args = {...}
    local default_config = {}
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

    local arg = ""

    for key, val in pairs(config) do
      arg = arg .. " -" .. key .. "=" .. val
    end

    vim.cmd(string.format("cexpr system('cargo build --message-format=short %s')", arg))
    vim.cmd "copen"
  end,
  nargs = "*"
}
