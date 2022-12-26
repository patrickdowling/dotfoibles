local status, _ = pcall(vim.cmd, "colorscheme base16-oceanicnext")
if not status then
    print("colorscheme not found!")
end
