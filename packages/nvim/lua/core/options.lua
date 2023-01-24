local opt = vim.opt

vim.g.mapleader = ","

-- Some of these are pre-loaded by vim-sensible

opt.backspace = { "indent", "eol", "start" }
opt.errorbells = false
opt.visualbell = false
opt.mouse = 'a'

opt.completeopt = { 'menu', 'menuone', 'noselect' }

opt.updatetime = 250
--opt.clipboard:append { 'unnamed' }--, 'unnamedplus' }

-- Line numbers
opt.number = true -- ...line numbers
opt.relativenumber = true -- ...relative to cursor
opt.cursorline = true -- ...highlight line with cursor

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.listchars = { tab = '→ ', eol = '¬', trail = '⋅', extends = '❯', precedes = '❮' }
opt.showbreak = '↪'
opt.list = true

-- Line wrapping
opt.wrap = true
opt.wrapmargin = 8
opt.linebreak = true
opt.showbreak = '…'

-- Search
opt.ignorecase = true -- case insensitive
opt.smartcase = true -- case sensitive if expression contains capital letter
opt.hlsearch = true -- highlight results
opt.incsearch = true -- incremental search

-- Tabs and indent
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
