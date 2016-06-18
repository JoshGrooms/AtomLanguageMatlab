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
        0: name: 'enclosure.group.open.matlab'
    end: /\)/
    endCaptures:
        0: name: 'enclosure.group.close.matlab'
    patterns:
        [{
            match: /(\w+)\s*(,)?/
            captures:
                1: name: 'variable.argument.input.matlab'
                2: name: 'operator.character.separator.matlab'
        }]
# FUNCTIONMULTIOUTPUT - Captures and labels the output argument list from function declarations.
#
#   This pattern is a subpattern of all MATLAB function declarations (found below) and is only meant to classify the output
#   argument list, not other parts of the function declaration.
functionMultiOutput =
    begin: /\[/
    beginCaptures:
        0: name: 'enclosure.group.open.matlab'
    end: /// ( \] ) \s* ( \= ) \s* ///
    endCaptures:
        1: name: 'enclosure.group.close.matlab'
        2: name: 'operator.character.assignment.matlab'
    patterns:
        [{
            match: /// ( \w+ ) \s* (,)? ///
            captures:
                1: name: 'variable.argument.output.matlab'
                2: name: 'operator.character.separator.matlab'
        }]
# FUNCTIONNAME - Captures and labels the name of any function or class method.
functionName =
    match:
        ///
            (?:
                ( get | set )
                (\.)
            )?
                ( \w+ )
        ///
    captures:
        1: name: 'keyword.control.matlab'
        2: name: 'operator.character.matlab'
        3: name: 'type.function.name.matlab'
# FUNCTIONSINGLEOUTPUT - Captures and labels function declarations with either one or zero output arguments.
functionSingleOutput =
    match: /// (\w+) \s* (\=) \s*///
    captures:
        1: name: 'variable.argument.output.matlab'
        2: name: 'operator.character.assignment.matlab'



# FUNCTIONDECLARATION - A complete set of patterns describing how MATLAB functions can be declared in source code.
functionDeclaration =
    begin:          /// ^\s* \b( function )\b ///
    beginCaptures:
        1: name:    'keyword.type.function.matlab'
    end:            /(.(?=\%)|\r?\n)/
    name:           'type.function.declaration.matlab'
    patterns:
        [
            functionMultiOutput,
            functionSingleOutput,
            functionInput,
            functionName,
        ];

module.exports = functionDeclaration
