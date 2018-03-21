# proc typeCheck(nodes: seq[Node], ctx: var Context): seq[Node]

# template getType(node: Node): Type =
#   node.typ

# template getType(nodes: seq[Node]): seq[Type] =
#   nodes.mapIt(node.typ)

# proc typeCheck(node: Node, ctx: var Context): Node =
#   node

# template expectKind(t: untyped, kind: untyped): untyped =
#   if `t`.kind != `kind`:
#     echo "Expected ", $`t`.kind, ", got ", $`kind`
#     quit(1)

# proc typeCheckCall(node: Node, ctx: var Context): Node =
#   result = node
#   let first = node.function.typeCheck(ctx)
#   let second = node.args.typeCheck(ctx)
#   expectKind(first.typ, T.Function)
#   let aType = first.typ.args
#   let rType = first.typ.returnType


# proc typeCheck(nodes: seq[Node], ctx: var Context): seq[Node] =
#   nodes.mapIt(node.typeCheck(ctx))
