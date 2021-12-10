command { "CreateWorkspace", function(name)
  require'neospaces'.create_workspace(name)
end, nargs = 1 }

nmap { '<c-t>', function()
  require'neospaces'.open_telescope_picker()
end}
