--- Loading of lua modules and plugins ---
------------------------------------------
require("user.plugins")
require("user.functions")
require("user.nvim-lspconf")
require("user.nvim-cmp")
require("user.nvim-navic")
require("user.telescope")
require("neoscroll").setup()
require("diffview")
require("toggleterm").setup()
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.opt.list = true

require("indent_blankline").setup {
   show_current_context = true,
   show_current_context_start = true,
	 show_end_of_line = true,
}

vim.g.indent_blankline_char = '|'
--vim.g.indent_blankline_char = '║'

--- Appearance settings ---
---------------------------
vim.o.background = "dark"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.wo.cursorline = true
vim.cmd "set noshowmode"
require('kanagawa').setup({
    commentStyle = { italic = false },
    keywordStyle = { italic = false},
    variablebuiltinStyle = { italic = false},
})
vim.cmd[[colorscheme kanagawa]]

--- Indentation configuration ---
---------------------------------
vim.opt.list = true

--- Autocomplete settings ---
-----------------------------
vim.o.completeopt = menu,menuone,noselect

---- disable comment autoadding on each new line
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

--- Keybindings ---
-------------------
---- resize windows with arrows
map("n", "<S-Up>", ":resize -2<CR>", { silent = true })
map("n", "<S-Down>", ":resize +2<CR>", { silent = true })
map("n", "<S-Left>", ":vertical resize -2<CR>", { silent = true })
map("n", "<S-Right>", ":vertical resize +2<CR>", { silent = true })
---- navigation between windows
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })
---- pop up different plugins and external programms
map("n", "<Space>fg", ":Telescope live_grep initial_mode=insert<CR>", { silent = true })
map("n", "<Space>ff", ":Telescope find_files initial_mode=insert<CR>", { silent = true })
map("n", "<C-o>", ":SymbolsOutlineOpen<CR>", { silent = true })
map("n", "<C-p>", ":SymbolsOutlineClose<CR>", { silent = true })
map("n", "<Space>e", ":Vifm<CR>", { silent = true })
map("n", "<Space>p", ":Telescope projects<CR>", { silent = true })
map("n", "<Space>g", ":LazyGit<CR>", { silent = true })
map("n", "<Space>t", ":ToggleTerm direction=float<CR>", { silent = true })
map("n", "<Space>do", ":DiffviewOpen<CR>", { silent = true })
map("n", "<Space>dc", ":DiffviewClose<CR>", { silent = true })
map("n", "<Space>m", ":lua require('harpoon.mark').add_file()<CR>", { silent = true })
map("n", "<Space>mm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })

---- navigation between tabs on bufferline
map("n", "<S-x>", ":bdelete<CR>")
map("n", "<S-h>", ":BufferPrevious<CR>")
map("n", "<S-l>", ":BufferNext<CR>")
---- just handy maps
map("n", "<Space>h", ":HopWord<CR>", { silent = true })
map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "<Bar>", ":vsplit<CR>", { silent = true })
map('n', '<C-b>', '"_cw<C-r>0<ESC>')
map('n', 'c', '"_c')
map('v', 'p', '"_dP')
--map('n', 'q:', "<Nop>")

---- tab size
local TAB_WIDTH = 2
local bo = vim.bo
bo.tabstop = TAB_WIDTH
bo.shiftwidth = TAB_WIDTH
bo.expandtab = true
vim.cmd "set ts=2 sw=2"
