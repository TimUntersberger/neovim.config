nmap { '<c-1>', '<cmd>tabnext 1<cr>' }
nmap { '<c-2>', '<cmd>tabnext 2<cr>' }
nmap { '<c-3>', '<cmd>tabnext 3<cr>' }
nmap { '<c-4>', '<cmd>tabnext 4<cr>' }
nmap { '<c-5>', '<cmd>tabnext 5<cr>' }
nmap { '<c-6>', '<cmd>tabnext 6<cr>' }
nmap { '<c-7>', '<cmd>tabnext 7<cr>' }
nmap { '<c-8>', '<cmd>tabnext 8<cr>' }
nmap { '<c-9>', '<cmd>tabnext 9<cr>' }
nmap { '<c-0>', '<cmd>tabnext 10<cr>' }

function Tabline()
  local s = ''

  for i=1,vim.fn.tabpagenr('$') do
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    s = s .. '%' .. i .. 'T'

    s = s .. ' %{luaeval("TabLabel(' .. i .. ')")} '
  end

  s = s ..'%#TabLineFill#%T'

  if vim.fn.tabpagenr('$') > 1 then
    s = s .. '%=%#TabLine#%999Xclose'
  end

  return s
end

function TabLabel(tab_id)
  local buflist = vim.fn.tabpagebuflist(tab_id)
  local winnr = vim.fn.tabpagewinnr(tab_id)
  local bufname = vim.fn.bufname(buflist[winnr])

  if vim.startswith(bufname, "term://") then
    local tokens = vim.split(bufname, ":")

    return tokens[#tokens]
  end

  return bufname
end
