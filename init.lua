---- Loading of lua modules and plugins ----
--------------------------------------------
require("user.plugins")
require("user.functions")
require("user.nvim-treesitter")
require("user.nvim-lspconf")
require("user.nvim-cmp")
require("user.nvim-navic")
require("user.nvim-tree")
require("neoscroll").setup()
require("toggleterm").setup()
require('kanagawa').setup({
 transparent = false,
 commentStyle = { italic = false },
 keywordStyle = { italic = false},
 variablebuiltinStyle = { italic = false},
})

vim.g.indent_blankline_char = '║'

---- Appearance settings ----
-----------------------------
vim.cmd[[colorscheme kanagawa]]
vim.cmd "set noshowmode"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.wo.cursorline = true

---- Indentation configuration ----
-----------------------------------
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

--- Autocomplete settings ---
-----------------------------
vim.o.completeopt = menu,menuone,noselect

--- disable comment autoadding on each new line
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

--- tab size
local TAB_WIDTH = 2
local bo = vim.bo
bo.tabstop = TAB_WIDTH
bo.shiftwidth = TAB_WIDTH
bo.expandtab = true

---- Keybindings ----
--- resize windows with arrows
map("n", "<S-Up>", ":resize -2<CR>", { silent = true })
map("n", "<S-Down>", ":resize +2<CR>", { silent = true })
map("n", "<S-Left>", ":vertical resize -2<CR>", { silent = true })
map("n", "<S-Right>", ":vertical resize +2<CR>", { silent = true })
--- navigation between windows
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })
--- pop up different external programms
map("n", "<C-o>", ":SymbolsOutlineOpen<CR>", { silent = true })
map("n", "<C-p>", ":SymbolsOutlineClose<CR>", { silent = true })
map("n", "<Space>e", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<Space>g", ":LazyGit<CR>", { silent = true })
map("n", "<Space>t", ":ToggleTerm direction=float<CR>", { silent = true })
map("n", "<Space>p", ":Telescope projects initial_mode=normal<CR>", { silent = true })
map("n", "<Space>fg", ":Telescope live_grep initial_mode=insert<CR>", { silent = true })
map("n", "<Space>ff", ":Telescope find_files initial_mode=insert<CR>", { silent = true })
--- navigation between tabs on bufferline
map("n", "<S-x>", ":BD<CR>")
map("n", "<S-h>", ":BufferPrevious<CR>")
map("n", "<S-l>", ":BufferNext<CR>")
--- just handy maps
map("n", "<Space>h", ":HopWord<CR>", { silent = true })
map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "<Bar>", ":vsplit<CR>", { silent = true })
map('n', '<C-j>', '"_cw<C-r>0<ESC>')
map('n', 'c', '"_c')
