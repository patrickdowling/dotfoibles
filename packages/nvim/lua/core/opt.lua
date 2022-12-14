local opt = vim.opt

opt.backspace = {"indent", "eol", "start"}
opt.errorbells = false
opt.visualbell = false

-- Line numbers
opt.number = true -- ...line numbers
opt.relativenumber = true -- ...relative to cursor
opt.cursorline = true -- ...highlight line with cursor

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Line wrapping
opt.wrap = true
opt.wrapmargin = 8
opt.linebreak = true

-- Search
opt.ignorecase = true -- case insensitive
opt.smartcase = true -- case sensitive if expression contains capital letter
opt.hlsearch = true -- highlight results
opt.incsearch = true -- incremental search
