if exists("b:current_syntax")
  finish
endif

syn keyword NogKeyword
  \ bind
  \ bind_range
  \ set
  \ enable
  \ ignore
  \ rule
  \ disable
  \ workspace
  \ bar
  \ import
  \ mode
  \ update_channel
  \ for
  \ if
  \ else
  \ async
  \ sleep
  \ loop

syn match NogComment /\/\/.*$/
syn region NogString start=/"/ skip=/\\./ end=/"/
syn match NogNumber /[0-9]\+/
syn match NogBoolean /\(false\|true\)/

hi def link NogComment Comment
hi def link NogString String
hi def link NogNumber Number
hi def link NogBoolean Boolean
hi def link NogKeyword Keyword
