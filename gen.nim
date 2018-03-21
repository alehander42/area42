generator(JS):
  function(name, _, args, expression):
    """
    function #{name}(#{%joinComma(args)} {
      #{expression}
    }
    """

  call(function, args):
    "#{function}(#{%joinComma(args)})"

  integer(i):
    "#{i}"

  label(label):
    "#{label}"

  record(_, _, _):
    ""

  init(name, fields, values):
    "{#{%joinComma(genField, fields, values)}}"

  access(obj, field):
    "#{obj}.#{field}"

  a(expressions):
    "#{%joinNl(expressions)}"

  genField(field, value):
    "#{field}: #{value}"

generator(C):
  function(name, @[A.. R], args, expression):
    """
    #{R} #{name}(#{%joinComma(genArg, args, A)}) {
      #{expression}
    }
    """

  call(function, args):
    "#{function}(#{%joinComma(args)})"

  integer(i):
    "#{i}"

  label(label):
    "#{label}"

  record(name, fields, F):
    """
    typedef struct #{name} {
      #{%joinNl(genArg, fields, F)}
    };
    """
  
  init(name, fields, values):
    "#{name}(#{%joinComma(genArg, fields, values)})"

  access(obj, field):
    "#{obj}.#{field}"

  a(expressions):
    "#{%map(expressions, ';\n')}"

  genArg(arg, t):
    "#{arg}: #{t}"





