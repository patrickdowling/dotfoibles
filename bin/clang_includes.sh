#!/bin/sh

# Helper for generating compile_flags.txt
# clangd -- at least on OS X -- can't seem to find the relevant system headers and needs help

clang++ -E -v -xc++ /dev/null 2>&1 | sed -n '/^#include </,/^End/p' | sed '1d;$d' | sed 's/ *\(.*\) *$/"\1"/' | sed 's/^[\"]/-isystem\n\"/'
