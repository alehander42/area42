import macros

macro grammar(rules: untyped): untyped =
  echo rules.treerepr

grammar:
  integer:    i@regex(r"[0-9]+")
  label:      label@regex(r"[a-z\-\+\=\*]+")
  element:    integer | label
  expression: element | call
  call:       leftParen function@expression ws args@join(expression, ws) rightParen
