" Enforce Script syntax for Vim
"
" Forked from C# syntax
"
" See https://community.bistudio.com/wiki/DayZ:Enforce_Script_Syntax

if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim


" type
syn keyword enfType                     int float bool string vector void Class typename auto
" storage
syn keyword enfStorage                  class enum typedef
" repeat / condition / label
syn keyword enfRepeat                   break continue do for foreach goto return while
syn keyword enfConditional              else if switch
syn keyword enfLabel                    case default
" there's no :: operator in Enforce Script
syn match enfOperatorError              display +::+
" user labels
syn match   enfLabel                    display +^\s*\I\i*\s*:\([^:]\)\@=+
" modifier
syn keyword enfModifier                 private protected static override proto native autoptr ref const out inout modded event
" constant
syn keyword enfConstant                 false null NULL true
" exception
syn keyword enfExceptionError           try catch finally throw

syn keyword enfStatement                new this


" Comments
syn keyword enfTodo             contained TODO FIXME XXX NOTE
syn region  enfComment          start="/\*"  end="\*/" contains=@enfCommentHook,enfTodo,@Spell
syn match   enfComment          "//.*$" contains=@enfCommentHook,enfTodo,@Spell


" Pre-processing directives
syn region      enfPreCondit
    \ start="^\s*#\s*\(define\|undef\|if\|elif\|else\|endif\)"
    \ skip="\\$" end="$" contains=enfComment keepend



" Strings and constants
syn match   enfSpecialError     contained "\\."
" Character literals
syn match   enfSpecialChar      contained +\\[nrt\\"]+
" unicode characters
syn region  enfString           start=+"+  end=+"+ end=+$+ contains=enfSpecialChar,enfSpecialError,@Spell
syn match   enfNumber           "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)\>"
syn match   enfNumber           "\(\<\d\+\.\d*\|\.\d\+\)"

" The default highlighting.
hi def link enfType                     Type
hi def link enfStorage                  StorageClass
hi def link enfRepeat                   Repeat
hi def link enfConditional              Conditional
hi def link enfLabel                    Label
hi def link enfModifier                 StorageClass
hi def link enfConstant                 Constant
hi def link enfExceptionError           Error
hi def link enfStatement                Statement
hi def link enfOperatorError            Error

hi def link enfTodo                     Todo
hi def link enfComment                  Comment

hi def link enfSpecialError             Error
hi def link enfString                   String
hi def link enfPreCondit                PreCondit
hi def link enfSpecialChar              SpecialChar
hi def link enfNumber                   Number

let b:current_syntax = "enforce"

let &cpo = s:cpo_save
unlet s:cpo_save
