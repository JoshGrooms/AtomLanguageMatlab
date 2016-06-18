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
    name: 'keyword.literal.matlab'
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
    name: 'literal.number.matlab'
# EMPTYSTRINGS - Captures any empty string in MATLAB.
emptyStrings =
    match: /(\')(\')/
    captures:
        1: name: 'enclosure.string.open.matlab'
        2: name: 'enclosure.string.close.matlab'
# STRINGS - Captures any legal string in MATLAB.
strings =
    match:
        '''
            (?<![\\w\\]\\)\\}])
            (\\')
            ([^\n\\']+)
            (\\')
        '''.deblank()
    captures:
        1: name: 'enclosure.string.open.matlab'
        2: name: 'literal.string.content.matlab'
        3: name: 'enclosure.string.close.matlab'
    name: 'literal.string.matlab'



module.exports = [ constants, numbers, emptyStrings, strings ];
