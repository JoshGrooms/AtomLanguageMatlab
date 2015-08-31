func    = 'storage.type.matlab'
ops     = 'keyword.operator.matlab'
argin   = 'variable.parameter.input.function.matlab'
argout  = 'variable.parameter.output.function.matlab'
ent     = 'entity.name.function.matlab'
open    = 'punctuation.definition.parameters.begin.matlab'
close   = 'punctuation.definition.parameters.end.matlab'



# FUNCTIONINPUT - Captures and labels the input argument list from function declarations.
#
#   This pattern is a subpattern of all MATLAB function declarations (found below) and is only meant to classify the input
#   argument list, not other parts of the function declaration.
#
#   CAPTURES:
#       ()
#       (x)
#       (x, y, z...)
functionInput =
    begin: /\(/;
    beginCaptures:
        0: name: 'keyword.operator.group.open.matlab';
    end: /\)/
    endCaptures:
        0: name: 'keyword.operator.group.close.matlab';
    patterns:
        [{
            match: /(\w+)\s*(,)?/
            captures:
                1: name: argin;
                2: name: ops;
        }]

# FUNCTIONMULTIOUTPUT - Captures and labels the output argument list from function declarations.
#
#   This pattern is a subpattern of all MATLAB function declarations (found below) and is only meant to classify the output
#   argument list, not other parts of the function declaration.
functionMultiOutput =
    begin: /\[/
    beginCaptures:
        0: name: 'keyword.operator.array.open.matlab';
    end:
        ///
            ( \] ) \s*
            ( \= ) \s*
            (?:
                ( get | set )
                ( \. )
            )?
            ( \w+ )
        ///
    endCaptures:
        1: name: 'keyword.operator.array.close.matlab';
        2: name: ops;
        3: name: 'keyword.special-method.matlab'
        4: name: ops;
        5: name: ent;
    patterns:
        [{
            match: /// ( \w+ ) \s* (,)? ///
            captures:
                1: name: argout;
                2: name: ops;
        }]

# FUNCTIONSINGLEOUTPUT - Captures and labels function declarations with either one or zero output arguments.
functionSingleOutput =
    match:
        ///
            (?:
                ( \w+ ) \s*
                ( \= ) \s*
            )?
            (?:
                ( get | set )
                (\.)
            )?
            ( \w+ )
        ///
    captures:
        1: name: argout;
        2: name: ops;
        3: name: 'keyword.special-method.matlab'
        4: name: ops;
        5: name: ent;



# FUNCTIONDECLARATION - A complete set of patterns describing how MATLAB functions can be declared in source code.
functionDefinition =
    begin: /// ^\s* \b( function )\b ///
    beginCaptures:
        1: name: func;
    end: /(.(?=\%)|\r?\n)/
    name: 'meta.function.declaration.matlab'
    patterns:
        [
            functionInput,
            functionMultiOutput,
            functionSingleOutput,
        ];

module.exports = functionDefinition
