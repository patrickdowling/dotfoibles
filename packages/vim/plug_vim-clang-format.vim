let g:clang_format#detect_style_file = 1
let g:clang_format#code_style="google"
let g:clang_format#style_options = { 
	\ "AllowShortIfStatementsOnASingleLine" : "true",
	\ "AllowShortCaseLabelsOnASingleLine" : "true",
	\ "AlwaysBreakTemplateDeclarations" : "true",
	\ "AllowShortBlocksOnASingleLine" : "true",
	\ "AllowShortFunctionsOnASingleLine" : "Inline",
	\ "BreakBeforeBraces" : "Custom",
	\ "BraceWrapping" : {
	\   "AfterFunction" : "true",
	\   "SplitEmptyRecord" : "false",
	\ },
	\ "Standard" : "C++11",
	\ "IndentWidth" : 2,
	\ "AccessModifierOffset" : -2,
	\ "ColumnLimit" : 100 }

" SpaceInEmptyBlock

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

