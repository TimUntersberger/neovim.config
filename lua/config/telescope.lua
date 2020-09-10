local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')
local actions = require('telescope.actions')
local make_entry = require('telescope.make_entry')

local session = irequire('lib.session')

nmap { 'gr', builtin.lsp_references }
nmap { '<c-l>ds', builtin.lsp_document_symbols }
nmap { '<c-l>ws', builtin.lsp_workspace_symbols }
nmap { '<c-l>b', builtin.buffers }
nmap { '<c-l>h', builtin.command_history }
nmap { '<c-l>c', builtin.commands }
nmap { '<leader>s', builtin.live_grep }
nmap { 
    '<c-l>q', 
    function() 
        builtin.quickfix{}
    end
}

nmap {
    '<leader>f',
    function()
        pickers.new({}, {
            prompt = 'Files',
            finder    = finders.new_oneshot_job({ "rg", "-i", "--hidden", "--files", "-g", "!.git" }, {
                entry_maker = make_entry.gen_from_file()
            }),
            sorter    = sorters.get_fuzzy_file(),
        }):find()
    end
}

-- TODO: picker that lists all code actions and the preview shows the description

nmap {
    '<c-l>s',
    function()
        pickers.new({}, {
            prompt = 'Sessions',
            finder = finders.new_table {
                results = session.list(),
                entry_maker = make_entry.gen_from_string()
            },
            sorter = sorters.get_norcalli_sorter(),
            attach_mappings = function(prompt_bufnr, map)
                local load_session = function()
                    local selection = actions.get_selected_entry(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    session.close()
                    session.load(selection.value)
                end

                local delete_session = function()
                    local selection = actions.get_selected_entry(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    session.delete(selection.value)
                end

                map('i', '<c-c>', function()
                  actions.close(prompt_bufnr)
                end)
                map('i', '<CR>', load_session)
                map('n', '<CR>', load_session)
                map('i', '<c-d>', delete_session)
                map('n', '<c-d>', delete_session)

                return true
            end
        }):find()
    end
}
