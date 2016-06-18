lineEnding = /(.(?=\%)|\r?\n)/



# CLASSMODIFIERS - Captures and labels modifier keywords applied to classes, properties, and methods.
classModifiers =
    begin: /\(/;
    beginCaptures:
        0: name: 'enclosure.group.open.matlab'
    end: /\)/;
    endCaptures:
        0: name: 'enclosure.group.close.matlab'
    patterns:
        [{
            match:
                ///
                    (\w+) \s*
                    (?:
                        ( \= ) \s*
                        ( \w+ ) \s*
                    )?
                    ( \, )?
                ///
            captures:
                1: name: 'keyword.qualifer.matlab'
                2: name: 'operator.character.assignment.matlab'
                3: name: 'keyword.qualifier.matlab'
                4: name: 'operator.character.matlab'
        }]

# CLASSINHERITANCE - Captures and labels the first superclass in a MATLAB class declaration line.
classInheritance =
    match:
        ///
            (\w+)
            (?:
                \s* ( \< ) \s*
                ( \w+ )
            )?
        ///
    captures:
        1: name: 'type.name.matlab'
        2: name: 'operator.character.matlab'
        3: name: 'type.name.matlab'

# CLASSMULTIPLEINHERITANCE - Captures and labels multiple superclass objects in a MATLAB class declaration line.
classMultipleInheritance =
    match: /\s*(\&)\s*(\w+)/
    captures:
        1: name: 'operator.character.matlab'
        2: name: 'type.name.matlab'

# CLASSDEFINITION - Captures and labels a class declaration line.
classDefinition =
    begin: /^\s*\b(classdef)\b\s+/
    beginCaptures:
        1: name: 'keyword.type.matlab'
    end: lineEnding;
    name: 'type.class.declaration.matlab'
    patterns:
        [
            classModifiers,
            classInheritance,
            classMultipleInheritance,
        ]

# ENUMDEFINITION - Captures and labels enumerator block declarations in MATLAB classes.
enumDefinition =
    match: /^\s*\b(enumeration)\b\s*\r?\n/
    captures:
        1: name: 'keyword.type.matlab'
    name: 'type.enumeration.declaration.matlab'

# PROPERTYDEFINITION - Captures and labels property block declarations in MATLAB classes.
propertyDefinition =
    begin: /^\s*\b(properties)\b/
    beginCaptures:
        1: name: 'keyword.qualifer.matlab'
    end: lineEnding;
    patterns:
        [
            classModifiers,
        ];
    name: 'type.class.property.declaration.matlab'

# METHODDEFINITION - Captures and labels method block declarations in MATLAB classes.
methodDefinition =
    begin: /^\s*\b(methods)\b/;
    beginCaptures:
        1: name: 'keyword.qualifier.matlab'
    end: lineEnding;
    patterns:
        [
            classModifiers,
        ];
    name: 'type.class.method.declaration.matlab'



module.exports = [ classDefinition, enumDefinition, propertyDefinition, methodDefinition ]
