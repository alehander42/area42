import os, tables, area42

variantp Type:
  Atom(label: string)
  Function(args: seq[Type], returnType: Type)
  Record(name: string, fields: Table[string, Type])

proc nodeToType(node: Node): Type =
  discard

typeChecker(Nominal):
  function(name, @[A.. R], args, expression):
    %top[name] = Function(A, R)
    %newScope(args, T)
    check(expression, r)
    void

  call(Function(A, R), A): R

  integer: Atom("int")

  label(label): %scope[label]

  record(name, fields, F):
    %top[name] = Record(name, %mapping(fields, F))
    void

  init(R is Record(name, %mapping(fields, F)), fields, F): R

  access(Record(name, %mappingWith(field, F)), field): F

  a(_): void

variantp Type:
  Atom(label: string)
  Function(args: seq[Type], returnType: Type)
  Record(name: string, fields: Table[string, Type])


unify:
  on Atom(label), Atom(label):            first
  on Atom(label), Record(label, _):       second
  on Record(label, _), Atom(label):       first
  on Record(label, F), Record(label, F):  first
  on Function(A, R), Function(A, R):      first

unify:
  on Atom(label), Atom(label):            first
  on Record(_, F), Record(_, F):          first
  on Function(A, R), Function(A, R):      first

