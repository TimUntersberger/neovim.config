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
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-git"] = {
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\rcodedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neofs = {
    config = { "\27LJ\2\nZ\0\1\4\0\6\0\t6\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2=\1\0\0009\1\5\0B\1\1\1K\0\1\0\frefresh\24~/Desktop/workspace\vexpand\afn\bvim\tpathù\1\1\0\6\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\3B\1\2\0016\1\b\0'\3\t\0'\4\n\0'\5\v\0B\1\4\1K\0\1\0#:lua require\"neofs\".open()<cr>\n<c-n>\6n\bMAP\rmappings\1\0\0\v<c-e>w\1\0\0\0\nsetup\nneofs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neofs",
    url = "https://github.com/TimUntersberger/neofs"
  },
  neogit = {
    config = { "\27LJ\2\nŒ\1\0\0\6\0\b\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0'\3\5\0'\4\6\0'\5\a\0B\1\4\1K\0\1\0\16:Neogit<cr>\r<space>g\6n\bMAP\1\0\4\17disable_hint\2\29disable_insert_on_commit\1\"disable_builtin_notifications\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n˝\5\0\0\n\0.\0V6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\25\0005\4\6\0009\5\3\0009\a\3\0009\a\4\a)\t¸ˇB\a\2\0025\b\5\0B\5\3\2=\5\a\0049\5\3\0009\a\3\0009\a\4\a)\t\4\0B\a\2\0025\b\b\0B\5\3\2=\5\t\0049\5\3\0009\a\3\0009\a\n\aB\a\1\0025\b\v\0B\5\3\2=\5\f\0049\5\r\0009\5\14\5=\5\15\0049\5\3\0005\a\17\0009\b\3\0009\b\16\bB\b\1\2=\b\18\a9\b\3\0009\b\19\bB\b\1\2=\b\20\aB\5\2\2=\5\21\0049\5\3\0009\5\22\0055\a\23\0B\5\2\2=\5\24\4=\4\3\0039\4\r\0009\4\26\0044\6\3\0005\a\27\0>\a\1\0065\a\28\0>\a\2\0064\a\3\0005\b\29\0>\b\1\aB\4\3\2=\4\26\3B\1\2\0016\1\0\0'\3\30\0B\1\2\0029\1\2\0015\3 \0005\4\31\0=\4!\0035\4#\0005\5\"\0=\5$\0045\5%\0=\5&\4=\4'\0035\4)\0005\5(\0=\5$\0045\5*\0=\5&\0045\5+\0=\5,\4=\4-\3B\1\2\1K\0\1\0\vgitlab\19merge_requests\1\0\2\nstate\vopened\nlimit\3d\1\0\1\nlimit\3d\1\0\0\1\0\2\nstate\vopened\nlimit\3d\vgithub\rmentions\1\0\1\nlimit\3d\vissues\1\0\0\1\0\3\vfilter\ball\nstate\topen\nlimit\3d\14filetypes\1\0\0\1\2\0\0\14gitcommit\fcmp_git\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\1\0\1\tname\rnvim_lsp\fsources\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\nX\0\1\6\0\4\0\n4\1\0\0\18\4\0\0009\2\0\0\18\5\1\0B\2\3\0016\2\1\0009\2\2\2'\4\3\0B\2\2\1K\0\1\0\31 do User LspAttachBuffers \bcmd\bvim\nsetupØ\2\1\0\r\0\n\0\0305\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0026\3\4\0\18\5\0\0B\3\2\4X\6\rÄ9\b\5\2\18\n\a\0B\b\2\3\15\0\b\0X\n\bÄ\18\f\t\0009\n\6\tB\n\2\2\14\0\n\0X\n\3Ä\18\f\t\0009\n\a\tB\n\2\1E\6\3\3R\6Ò9\3\b\0013\5\t\0B\3\2\1K\0\1\0\0\20on_server_ready\finstall\17is_installed\15get_server\vipairs\31nvim-lsp-installer.servers\23nvim-lsp-installer\frequire\1\t\0\0\rtsserver\nvimls\18rust_analyzer\nvuels\thtml\ncssls\rdockerls\vjsonls\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¢\2\0\0\a\0\r\0\0175\0\0\0006\1\1\0'\3\2\0B\1\2\0029\2\3\0015\4\4\0=\0\5\0045\5\6\0=\5\a\0045\5\b\0005\6\t\0=\6\n\5=\5\v\4B\2\2\0019\2\f\1B\2\1\1K\0\1\0\tinit\26context_commentstring\vconfig\1\0\2\trust\n// %s\blua\n-- %s\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\nsetup\28nvim-treesitter.configs\frequire\1\f\0\0\blua\trust\ttoml\bvue\tyaml\15javascript\bcss\thtml\tjson\15typescript\btsx\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nì\1\0\0\5\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0'\2\4\0'\3\5\0'\4\6\0B\0\4\1K\0\1\0,:lua require\"nvim-web-devicons\".setup{}\6*\16ColorScheme\nAUCMD\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Tim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
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
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nì\1\0\0\5\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0'\2\4\0'\3\5\0'\4\6\0B\0\4\1K\0\1\0,:lua require\"nvim-web-devicons\".setup{}\6*\16ColorScheme\nAUCMD\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\rcodedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\6\0\b\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0'\3\5\0'\4\6\0'\5\a\0B\1\4\1K\0\1\0\16:Neogit<cr>\r<space>g\6n\bMAP\1\0\4\17disable_hint\2\29disable_insert_on_commit\1\"disable_builtin_notifications\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n®\1\0\0\6\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0'\3\4\0'\4\5\0'\5\6\0B\1\4\0016\1\3\0'\3\4\0'\4\a\0'\5\b\0B\1\4\1K\0\1\0\29:Telescope live_grep<cr>\n<c-f>\30:Telescope find_files<cr>\n<c-p>\6n\bMAP\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¢\2\0\0\a\0\r\0\0175\0\0\0006\1\1\0'\3\2\0B\1\2\0029\2\3\0015\4\4\0=\0\5\0045\5\6\0=\5\a\0045\5\b\0005\6\t\0=\6\n\5=\5\v\4B\2\2\0019\2\f\1B\2\1\1K\0\1\0\tinit\26context_commentstring\vconfig\1\0\2\trust\n// %s\blua\n-- %s\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\nsetup\28nvim-treesitter.configs\frequire\1\f\0\0\blua\trust\ttoml\bvue\tyaml\15javascript\bcss\thtml\tjson\15typescript\btsx\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\nX\0\1\6\0\4\0\n4\1\0\0\18\4\0\0009\2\0\0\18\5\1\0B\2\3\0016\2\1\0009\2\2\2'\4\3\0B\2\2\1K\0\1\0\31 do User LspAttachBuffers \bcmd\bvim\nsetupØ\2\1\0\r\0\n\0\0305\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0026\3\4\0\18\5\0\0B\3\2\4X\6\rÄ9\b\5\2\18\n\a\0B\b\2\3\15\0\b\0X\n\bÄ\18\f\t\0009\n\6\tB\n\2\2\14\0\n\0X\n\3Ä\18\f\t\0009\n\a\tB\n\2\1E\6\3\3R\6Ò9\3\b\0013\5\t\0B\3\2\1K\0\1\0\0\20on_server_ready\finstall\17is_installed\15get_server\vipairs\31nvim-lsp-installer.servers\23nvim-lsp-installer\frequire\1\t\0\0\rtsserver\nvimls\18rust_analyzer\nvuels\thtml\ncssls\rdockerls\vjsonls\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n˝\5\0\0\n\0.\0V6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\25\0005\4\6\0009\5\3\0009\a\3\0009\a\4\a)\t¸ˇB\a\2\0025\b\5\0B\5\3\2=\5\a\0049\5\3\0009\a\3\0009\a\4\a)\t\4\0B\a\2\0025\b\b\0B\5\3\2=\5\t\0049\5\3\0009\a\3\0009\a\n\aB\a\1\0025\b\v\0B\5\3\2=\5\f\0049\5\r\0009\5\14\5=\5\15\0049\5\3\0005\a\17\0009\b\3\0009\b\16\bB\b\1\2=\b\18\a9\b\3\0009\b\19\bB\b\1\2=\b\20\aB\5\2\2=\5\21\0049\5\3\0009\5\22\0055\a\23\0B\5\2\2=\5\24\4=\4\3\0039\4\r\0009\4\26\0044\6\3\0005\a\27\0>\a\1\0065\a\28\0>\a\2\0064\a\3\0005\b\29\0>\b\1\aB\4\3\2=\4\26\3B\1\2\0016\1\0\0'\3\30\0B\1\2\0029\1\2\0015\3 \0005\4\31\0=\4!\0035\4#\0005\5\"\0=\5$\0045\5%\0=\5&\4=\4'\0035\4)\0005\5(\0=\5$\0045\5*\0=\5&\0045\5+\0=\5,\4=\4-\3B\1\2\1K\0\1\0\vgitlab\19merge_requests\1\0\2\nstate\vopened\nlimit\3d\1\0\1\nlimit\3d\1\0\0\1\0\2\nstate\vopened\nlimit\3d\vgithub\rmentions\1\0\1\nlimit\3d\vissues\1\0\0\1\0\3\vfilter\ball\nstate\topen\nlimit\3d\14filetypes\1\0\0\1\2\0\0\14gitcommit\fcmp_git\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\1\0\1\tname\rnvim_lsp\fsources\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: neofs
time([[Config for neofs]], true)
try_loadstring("\27LJ\2\nZ\0\1\4\0\6\0\t6\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2=\1\0\0009\1\5\0B\1\1\1K\0\1\0\frefresh\24~/Desktop/workspace\vexpand\afn\bvim\tpathù\1\1\0\6\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\3B\1\2\0016\1\b\0'\3\t\0'\4\n\0'\5\v\0B\1\4\1K\0\1\0#:lua require\"neofs\".open()<cr>\n<c-n>\6n\bMAP\rmappings\1\0\0\v<c-e>w\1\0\0\0\nsetup\nneofs\frequire\0", "config", "neofs")
time([[Config for neofs]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
