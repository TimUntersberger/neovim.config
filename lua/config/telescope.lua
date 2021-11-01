local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        layout_strategy = "center",
        layout_config = {
          width = 0.4,
          height = 0.3,
          center = {
            preview_cutoff = 1000 -- never display preview
          }
        },
        sorting_strategy = "ascending",
        results_title = false,
        mappings = {
          i = {
            ["<esc>"] = actions.close
          }
        }
    }
}

nmap { '<c-l>b', builtin.buffers }
nmap { '<c-l>h', builtin.command_history }
nmap { '<c-l>c', builtin.commands }
nmap { '<c-f>', builtin.live_grep }
nmap { '<c-l>q', builtin.quickfix }

local search_cwd = ""

command { 'ChangeFindFilesCwd', function()
  local input = vim.fn.input {
    prompt = "Cwd prefix: ",
    default = search_cwd,
    cancelreturn = "__CANCEL__"
  }
  if input ~= "__CANCEL__" then
    search_cwd = input
  end
end}

nmap {
    '<c-p>',
    function()
        builtin.find_files {
            find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" },
            -- cwd = vim.fn.getcwd() .. "\\" .. search_cwd
        }
    end
}

