lineEnding = /(.(?=\%)|\r?\n)/



# CLASSMODIFIERS - Captures and labels modifier keywords applied to classes, properties, and methods.
classModifiers =
    begin: /\(/;
    beginCaptures:
        0: name: 'punctuation.definition.parameters.begin.matlab'
    end: /\)/;
    endCaptures:
        0: name: 'punctuation.definition.parameters.end.matlab'
    patterns:
        [{
            match:
                ///
                    (\w+) \s*
                    (?:
                        ( \= )
                        ( \w+ )
                    )?
                    ( \, )?
                ///
            captures:
                1: name: 'storage.modifier.matlab'
                2: name: 'keyword.operator.matlab'
                3: name: 'storage.modifier.matlab'
                4: name: 'keyword.operator.matlab'
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
        1: name: 'entity.name.class.matlab'
        2: name: 'keyword.operator.matlab'
        3: name: 'entity.name.superclass.matlab'

# CLASSMULTIPLEINHERITANCE - Captures and labels multiple superclass objects in a MATLAB class declaration line.
classMultipleInheritance =
    match: /\s*(\&)\s*(\w+)/
    captures:
        1: name: 'keyword.operator.matlab'
        2: name: 'entity.name.superclass.matlab'


# CLASSDEFINITION - Captures and labels a class declaration line.
classDefinition =
    begin: /^\s*\b(classdef)\b\s+/
    beginCaptures:
        1: name: 'storage.type.matlab'
        2: name: 'entity.name.class.matlab'
        3: name: 'keyword.operator.matlab'
        4: name: 'entity.name.class.matlab'

    end: lineEnding;
    name: 'meta.class.declaration.matlab'
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
        1: name: 'keyword.other.matlab';
    name: 'meta.class.enumerators.matlab';

# PROPERTYDEFINITION - Captures and labels property block declarations in MATLAB classes.
propertyDefinition =
    begin: /^\s*\b(properties)\b/
    beginCaptures:
        1: name: 'keyword.other.matlab'
    end: lineEnding;
    patterns:
        [
            classModifiers,
        ];
    name: 'meta.class.properties.matlab'

# METHODDEFINITION - Captures and labels method block declarations in MATLAB classes.
methodDefinition =
    begin: /^\s*\b(methods)\b/;
    beginCaptures:
        1: name: 'keyword.other.matlab'
    end: lineEnding;
    patterns:
        [
            classModifiers,
        ];
    name: 'meta.class.methods.matlab'



module.exports = [ classDefinition, enumDefinition, propertyDefinition, methodDefinition ]
