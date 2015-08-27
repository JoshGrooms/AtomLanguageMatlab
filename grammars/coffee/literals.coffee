# DEBLANK - Removes all whitespace from a string.
String::deblank = ->
    return @replace(/(\s*|\r|\n)/gm, '');

# CONSTANTS - Captures MATLAB constant names, but only in their non-functional form.
constants =
    match:
        '''
            \\b
            (?<![\\.])
            (
                   eps
                 | false
                 | flintmax
                 | inf | Inf
                 | intmax
                 | intmin
                 | namelengthmax
                 | nan | NaN
                 | pi
                 | realmax
                 | realmin
                 | true
            ) (?! [\\(\\.] )
            \\b
        '''.deblank()
    name: 'constant.language.matlab'

# NUMBERS - Captures any legal numeric literal in MATLAB.
numbers =
    match:
        '''
            (?<![\\w\\.])
            \\d+
            \\.?
            \\d*
            (?:
                [eE]
                [\\+\\-]?
                \\d+
            )?
            [ij]?
            \\b
        '''.deblank();
    name: 'constant.numeric.matlab'

# STRINGS - Captures any legal string in MATLAB.
strings =
    match:'''(?<![\\w\\]\\)\\}])(\\')[^\n]*(\\')'''
    captures:
        1: name: 'punctuation.definition.string.begin.matlab'
        2: name: 'punctuation.definition.string.end.matlab'
    name: 'string.quoted.single.matlab'


module.exports = [ constants, numbers, strings ];
