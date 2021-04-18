local devicons = require('nvim-web-devicons')

autocmd {
  { "ColorScheme" },
  { "*" },
  function()
    if not devicons.has_loaded() then
      devicons.setup()
    end
  end
}
