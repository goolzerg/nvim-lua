function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<C-q>', [[<C-\><C-n>:q<cr>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
