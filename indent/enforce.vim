" Enforce Script indent for Vim

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" Enforce is like indenting C
setlocal cindent
" Avoid gross over-identing inside parentheses
setlocal cinoptions=(1s

let b:undo_indent = "setl cin<"
