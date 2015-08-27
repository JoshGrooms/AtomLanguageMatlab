




String::deblank = ->
    return @replace(/(\s*|\r|\n)/gm, '');


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
                 | realmax
                 | realmin
                 | true
            ) (?! [\\(\\.] )
            \\b
        '''.deblank()
    name: 'constant.language.matlab'


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


strings =
    match: /(\').*(\')/
    captures:
        1: name: 'punctuation.definition.string.begin.matlab'
        2: name: 'punctuation.definition.string.end.matlab'
    name: 'string.quoted.single.matlab'


module.exports = [ constants, numbers, strings ];
