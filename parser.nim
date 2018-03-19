import macros

macro grammar(rules: untyped): untyped =
  echo rules.treerepr

# ws nl leftParen rightParen are builtins

grammar:
  program =>              *(topLevel <- topLevel nl) # topLevel will be a seq with all the nodes
  topLevel =>             function | call 
  function =>             typeDefinition functionDefinition
  call =>                 leftParen function:expression ws args:join(expression, ws) rightParen
  typeDefinition =>       leftParen "type" ws types:join(typ, ws) rightParen
  functionDefinition =>   leftParen "function" ws name:label ws leftParen functionArgs:join(label, ws) rightParen expression:expression rightParen
  typ =>                  typeLabel:regex(r"[A-Z][a-zA-Z\-]*")
  expression =>           element | call
  element =>              integer | label
  label =>                label:regex(r"[a-z\-\+\=\*]+")
  integer =>              i:regex(r"[0-9]+")
