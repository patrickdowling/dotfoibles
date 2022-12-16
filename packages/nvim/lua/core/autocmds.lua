-- vim.api.nvim_create_autocmd
vim.cmd("autocmd FileType make setlocal noexpandtab")
vim.cmd("autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown")
