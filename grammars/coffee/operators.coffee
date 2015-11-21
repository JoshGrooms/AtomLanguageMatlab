# OPERATORS - Captures all symbolic operators that MATLAB uses.
operators =
    match:
        ///
            (
                  \= | \=\=
                | \~ | \~\=
                | \> | \>\=
                | \< | \<\=
                | \& | \&\&
                | \| | \|\|
                | \+ | \.\+
                | \\ | \.\\
                | \/ | \.\/
                | \^ | \.\^
                | \* | \.\*
                | \- | \.\-
                | \@
                | \:
                | \;
                | \!
                | \.
                | \,
                | \'
            )
        ///
    name: 'keyword.operator.matlab';

# ENCLOSURES - Captures all enclosure characters that MATLAB uses.
enclosures =
    [
        {
            match: /\[/;
            name: 'keyword.operator.array.open.matlab';
        }
        {
            match: /\]/;
            name: 'keyword.operator.array.close.matlab';
        }
        {
            match: /\(/;
            name: 'keyword.operator.group.open.matlab';
        }
        {
            match: /\)/;
            name: 'keyword.operator.group.close.matlab';
        }
        {
            match: /\{/;
            name: 'keyword.operator.cell.open.matlab';
        }
        {
            match: /\}/;
            name: 'keyword.operator.cell.close.matlab';
        }
    ]



module.exports = [ operators, enclosures ];
