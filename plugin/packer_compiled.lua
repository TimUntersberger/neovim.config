-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\Tim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\Tim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Tim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Tim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\Tim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  neofs = {
    config = { "\27LJ\2\ne\0\0\4\0\a\0\v6\0\0\0006\1\2\0009\1\3\0019\1\4\1'\3\5\0B\1\2\2=\1\1\0006\0\0\0009\0\6\0B\0\1\1K\0\1\0\frefresh\24~/Desktop/workspace\vexpand\afn\bvim\tpath\afmù\1\1\0\6\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\3B\1\2\0016\1\b\0'\3\t\0'\4\n\0'\5\v\0B\1\4\1K\0\1\0#:lua require\"neofs\".open()<cr>\n<c-n>\6n\bMAP\rmappings\1\0\0\v<c-e>w\1\0\0\0\nsetup\nneofs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neofs",
    url = "https://github.com/TimUntersberger/neofs"
  },
  neogit = {
    config = { "\27LJ\2\nŒ\1\0\0\6\0\b\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0'\3\5\0'\4\6\0'\5\a\0B\1\4\1K\0\1\0\16:Neogit<cr>\r<space>g\6n\bMAP\1\0\4\29disable_insert_on_commit\1\"disable_builtin_notifications\2 disable_commit_confirmation\2\17disable_hint\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n®\1\0\0\6\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0'\3\4\0'\4\5\0'\5\6\0B\1\4\0016\1\3\0'\3\4\0'\4\a\0'\5\b\0B\1\4\1K\0\1\0\29:Telescope live_grep<cr>\n<c-f>\30:Telescope find_files<cr>\n<c-p>\6n\bMAP\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-code-dark",
    url = "https://github.com/tomasiser/vim-code-dark"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n®\1\0\0\6\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0'\3\4\0'\4\5\0'\5\6\0B\1\4\0016\1\3\0'\3\4\0'\4\a\0'\5\b\0B\1\4\1K\0\1\0\29:Telescope live_grep<cr>\n<c-f>\30:Telescope find_files<cr>\n<c-p>\6n\bMAP\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\6\0\b\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0'\3\5\0'\4\6\0'\5\a\0B\1\4\1K\0\1\0\16:Neogit<cr>\r<space>g\6n\bMAP\1\0\4\29disable_insert_on_commit\1\"disable_builtin_notifications\2 disable_commit_confirmation\2\17disable_hint\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: neofs
time([[Config for neofs]], true)
try_loadstring("\27LJ\2\ne\0\0\4\0\a\0\v6\0\0\0006\1\2\0009\1\3\0019\1\4\1'\3\5\0B\1\2\2=\1\1\0006\0\0\0009\0\6\0B\0\1\1K\0\1\0\frefresh\24~/Desktop/workspace\vexpand\afn\bvim\tpath\afmù\1\1\0\6\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\3B\1\2\0016\1\b\0'\3\t\0'\4\n\0'\5\v\0B\1\4\1K\0\1\0#:lua require\"neofs\".open()<cr>\n<c-n>\6n\bMAP\rmappings\1\0\0\v<c-e>w\1\0\0\0\nsetup\nneofs\frequire\0", "config", "neofs")
time([[Config for neofs]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
