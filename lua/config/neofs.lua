local neofs = require('neofs')

neofs.setup {
  devicons = true,
  mappings = {
    ["<c-e>w"] = function(fm)
      fm.path = vim.fn.expand("~/Desktop/workspace/")
      fm.refresh()
    end
  }
}

nmap {
  "<c-n>",
  function() 
    local root = vim.fn.expand("%:h:p")
    if root == "" then
      root = vim.fn.getcwd()
    end
    neofs.open(root)
  end
}

-- nmap {
--   "<c-e>w",
--   function() 
--     neofs.open(vim.fn.expand("~/Desktop/workspace/"))
--   end
-- }
