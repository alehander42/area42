import macros

macro typeChecker*(name: untyped, rules: untyped): untyped =
  echo rules.treerepr
