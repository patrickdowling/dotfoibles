local status, base16 = pcall(require, 'base16-colorscheme')
if not status then return end

vim.cmd [[colorscheme base16-oceanicnext]]
