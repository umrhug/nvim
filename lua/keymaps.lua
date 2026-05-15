local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
-- normal_mode = 'n'
-- insert_mode = 'i'
-- visual_mode = 'v'
-- visual_block_mode = 'x'
-- term_mode = 't'
-- command_mode = 'c'

-- Normal --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- New tab
keymap('n', 'te', ':tabedit', opts)
keymap('n', 'gn', ':tabnew<Return>', opts)
-- Move tab
keymap('n', '<C-n>', 'gT', opts)
keymap('n', '<C-p>', 'gt', opts)

-- clear hlsearch selections
keymap('n', 'gh', ":let @/=''<CR>", opts)

-- Split window
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Do not yank with x
keymap('n', 'x', '"_x', opts)

-- Delete a word backwards
-- NG setting; keymap('n', 'dw', 'vb_d', opts)

-- Move cursor to BOL
keymap('n', '<leader>h', '^', opts)
-- Move cursor to EOL
keymap('n', '<leader>l', '$', opts)

-- Swap keys ";" and ":"
keymap('n', ';', ':', opts)

-- Yank to EOL
keymap('n', 'Y', 'y$', opts)

-- Force quit
keymap('n', '<Space>q', ':<C-u>q!<Return>', opts)

-- Erase highlight
keymap('n', '<ESC><ESC>', ':<C-u>set nohlsearch<Return>', opts)

-- Insert mode --
-- Press jk fast to exit insert mode
keymap('i', 'jk', '<ESC>', opts)

-- Insert a space <SPACE> after the comma ','
keymap('i', ',', ',<SPACE>', opts)

-- Visual mode --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- select until EOL automatically
keymap('v', 'v', '$h', opts)

-- #0 register
-- NG setting; keymap('v', '<C-p>', '"0p', opts)

