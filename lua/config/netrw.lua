local netrw = nil

vim.g.netrw_liststyle = 0 
vim.g.netrw_browse_split = 4 -- use previous window to open a file
vim.g.netrw_banner = 0 -- do not draw top banner
vim.g.netrw_dirhistmax = 0 -- disable generation of .netrwhist file
vim.g.netrw_altv = 1 -- change from left splitting to right splitting 

nmap {
  "<c-n>",
  function()
    print(netrw)
    if netrw then
      vim.api.nvim_win_close(netrw, false)
      netrw = nil
    else
      local cwd = vim.fn.getcwd()
      vim.cmd(string.format("Lexplore20 %s", cwd))
      netrw = vim.fn.win_getid()
    end
  end
}
