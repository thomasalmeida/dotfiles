vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- Split window keybindings
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>')
vim.keymap.set('n', '<leader>ss', ':split<CR>')

-- Quick save and quit keybindings
vim.keymap.set('n', 'QQ', ':quit<CR>')
vim.keymap.set('n', 'WW', ':write<CR>')

-- Buffer navigation shortcuts
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>bp', ':bprev<CR>')
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>')
vim.keymap.set('n', '<leader>bl', ':BufferLinePick<CR>')
vim.keymap.set('n', '<leader>bb', ':Telescope buffers<CR>')

-- Window resizing keybindings
vim.keymap.set('n', '<c-a>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<c-d>', ':vertical resize +2<CR>')
vim.keymap.set('n', '<c-s>', ':resize +2<CR>')
vim.keymap.set('n', '<c-w>', ':resize -2<CR>')

-- Reset window size
vim.keymap.set('n', '<c-0>', ':wincmd =<CR>')

-- Copy to the system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

-- Paste from the system clipboard
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')
