require("nvim-tree").setup({
  respect_buf_cwd = true,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "h", action = "close_node" },
        { key = { "l", "o" }, action = "edit" },
        { key = "<CR>", action = "cd" }
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
