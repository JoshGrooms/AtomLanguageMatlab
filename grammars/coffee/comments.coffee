# COMMENTBLOCK - Captures block comments in MATLAB source code.
commentBlock =
    begin: /\%\{/
    beginCaptures: 'comment.block.open.matlab'
    contentName: 'comment.block.content.matlab'
    end: /(\%\})/
    endCaptures: 'comment.block.close.matlab'
    name: 'comment.block.matlab'

# COMMENTLINE - Captures single-line comments in MATLAB source code.
commentLine =
    match: /(\%)(.*)\r?\n/
    captures:
        1: name: 'comment.line.open.matlab'
        2: name: 'comment.line.content.matlab'
    name: 'comment.line.matlab'

commentSection =
    match: /(\%{2})(.*)\r?\n/;
    captures:
        1: name: 'comment.section.open.matlab'
        2: name: 'comment.section.content.matlab'
    name: 'comment.section.matlab'



module.exports = [ commentBlock, commentSection, commentLine ];
