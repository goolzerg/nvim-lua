local navic = require("nvim-navic")
require("lualine").setup({
    sections = {
        lualine_c = {
          { navic.get_location, cond = navic.is_available },
          {'filename',
           file_status = true, -- displays file status (readonly status, modified status)
           path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
        }
    },
})
