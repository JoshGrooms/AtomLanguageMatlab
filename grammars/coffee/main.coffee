
{ makeGrammar, rule } = require("atom-syntax-tools")

grammar =
    fileTypes:      ["m"]
    name:           "MATLAB"
    scopeName:      "source.matlab"

    patterns:
        [
            require('./classes')
            require('./comments')
            require('./functions')
            require('./keywords')
            require('./literals')
            require('./operators')
        ];



flattenPatterns = ->
    result = [];
    for pattern in grammar.patterns
        if Array.isArray(pattern)
            for subpattern in pattern
                result = result.concat(subpattern);
        else
            result = result.concat(pattern);

    grammar.patterns = result;










flattenPatterns();
makeGrammar grammar, "CSON"
