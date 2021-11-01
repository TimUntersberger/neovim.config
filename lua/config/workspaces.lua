local util = require "util"

local M = {}

M.data_path = vim.fn.stdpath "data"
M.file_name = "neospaces.txt"

function M.get_data_file()
  return vim.loop.fs_open(util.join_path(M.data_path, M.file_name), "r", 438)
end

function M.get_workspaces()
  local file = M.get_data_file()
  local size = vim.loop.fs_fstat(file).size
  local data = vim.loop.fs_read(file, size, -1)
  vim.loop.fs_close(file)

  local result = {}
  for _, line in ipairs(vim.split(data, '\n')) do
    local tokens = vim.split(line, ' ')
    result[tokens[1]] = tokens[2]
  end

  return result
end

function M.get_workspace_name()
  local workspaces = M.get_workspaces()
  local cwd = vim.fn.getcwd()

  for name, path in pairs(workspaces) do
    if path == cwd then
      return name
    end
  end
end

function M.save_workspaces(workspaces)
  local output = ""
  for name, path in pairs(workspaces) do
    output = output .. string.format("%s %s\n", name, path)
  end

  local file = M.get_data_file()
  vim.loop.fs_write(file, output, -1)
  vim.loop.fs_close(file)
end

function M.delete_workspace(name)
  local workspaces = M.get_workspaces()
  workspaces[name] = nil
  M.save_workspaces(workspaces)
end

function M.create_workspace(name)
  local workspaces = M.get_workspaces()
  workspaces[name] = vim.fn.getcwd()
  M.save_workspaces(workspaces)
end

function M.open_workspace(name)
  local workspaces = M.get_workspaces()
  local workspace_path = workspaces[name]

  if workspace_path then
    vim.cmd [[wa]]
    vim.cmd [[%bw!]]
    vim.cmd(":cd " .. workspace_path)
  else
    print(string.format("Workspace '%s' doesn't exist", name))
  end
end

function M.open_telescope_picker()
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local sorters = require('telescope.sorters')
  local state = require('telescope.actions.state')
  local make_entry = require('telescope.make_entry')
  local actions = require('telescope.actions')

  pickers.new({}, {
      prompt = 'Sessions',
      finder = finders.new_table {
          results = vim.tbl_keys(M.get_workspaces()),
          entry_maker = make_entry.gen_from_string()
      },
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(prompt_bufnr, map)
          local load_session = function()
              local selection = state.get_selected_entry(prompt_bufnr)
              actions.close(prompt_bufnr)
              M.open_workspace(selection.value)
          end

          local delete_session = function()
              local selection = state.get_selected_entry(prompt_bufnr)
              actions.close(prompt_bufnr)
              M.delete_workspace(selection.value)
          end

          map('i', '<CR>', load_session)
          map('n', '<CR>', load_session)
          map('i', '<c-d>', delete_session)
          map('n', '<c-d>', delete_session)

          return true
      end
  }):find()
end

command { "CreateWorkspace", M.create_workspace, nargs = 1 }
nmap { '<c-t>', M.open_telescope_picker }

return M
