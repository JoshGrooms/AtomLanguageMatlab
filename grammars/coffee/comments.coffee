# COMMENTBLOCK - Captures block comments in MATLAB source code.
commentBlock =
    begin: /(\%\{)/
    beginCaptures:
        1: name: 'comment.block.open.matlab'
    end: /(\%\})/
    endCaptures:
        1: name: 'comment.block.close.matlab'
    contentName: 'comment.block.content.matlab'
    name: 'comment.block.matlab'

# COMMENLINE - Captures single-line comments in MATLAB source code.
commentLine =
    match: /(\%)(.*)\r?\n/
    captures:
        1: name: 'comment.line.open.matlab'
        2: name: 'comment.line.content.matlab'
    name: 'comment.line.matlab'


module.exports = [ commentBlock, commentLine ];
