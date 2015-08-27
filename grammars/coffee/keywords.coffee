
# KEYWORDDECLARATIONS - Keywords that control type, function, and scoping declarations for variables.
keywordDeclarations =
    match:
        ///
            \b
            (
                  classdef
                | function
                | global
                | persistent
            )
            \b
        ///

    name: 'storage.type.matlab'

# KEYWORDCONTROLS - Keywords that control the flow of MATLAB program execution.
keywordControls =
    match:
        ///
            \b
            (
                  break
                | case
                | catch
                | continue
                | else
                | elseif
                | end
                | for
                | if
                | otherwise
                | parfor
                | return
                | spmd
                | switch
                | try
                | while
            )
            \b
        ///
    name: 'keyword.control.matlab'



module.exports = [ keywordDeclarations, keywordControls ];
