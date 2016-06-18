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
    name: 'operator.character.matlab'

# ENCLOSURES - Captures all enclosure characters that MATLAB uses.
enclosures =
    [
        {
            match: /\[/;
            name: 'enclosure.array.open.matlab'
        }
        {
            match: /\]/;
            name: 'enclosure.array.close.matlab'
        }
        {
            match: /\(/;
            name: 'enclosure.group.open.matlab'
        }
        {
            match: /\)/;
            name: 'enclosure.group.close.matlab'
        }
        {
            match: /\{/;
            name: 'enclosure.cell.open.matlab'
        }
        {
            match: /\}/;
            name: 'enclosure.cell.close.matlab'
        }
    ];



module.exports = [ operators, enclosures ];
