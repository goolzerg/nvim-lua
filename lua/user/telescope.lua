local fb_actions = require "telescope".extensions.file_browser.actions
local actions = require "telescope.actions"
require("telescope").setup {
  defaults = {
    initial_mode = "normal"
  },
  extensions = {
    file_browser = {
      hide_parent_dir = true,	
      hidden = true,
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        ["n"] = {
          ["r"] = fb_actions.rename,
          ["a"] = fb_actions.create,
          ["d"] = fb_actions.remove,
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = actions.select_default,
          ["q"] = actions.close,
          ["<Space>"] = actions.toggle_selection,
        },
      },
    },
  },
}
require("telescope").load_extension "file_browser"
