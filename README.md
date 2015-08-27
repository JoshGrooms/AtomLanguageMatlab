# MATLAB Language Support for Atom

## About
This is a custom-written grammar package supporting MATLAB syntax in the Atom text editor.

I put this package together as a learning/review exercise (learning how to write Atom grammars, reviewing regular expressions (ugh)). Originally, it was forked from the MATLAB grammar package by James Ritchie with the intent of just tweaking some of the settings, but it has now turned into a complete and independent rewrite of the whole grammar. The original package can be found here:

https://github.com/JamesRitchie/language-matlab

From the user's perspective, there are some changes here that are worth mentioning:
    - The highlighting of class, function, method, and property block declarations have been tweaked:
      > Class property accessors (i.e. "get" and "set") now get special highlighting.
      > Class modifiers are now highlighted as keywords that they are.
    - Several changes have been made to operator highlighting:
      > Only symbolic operators receive highlighting. Functional ones like 'isa' and 'isnumeric' no longer do.
      > Additional operators receive highlighting.
      > Enclosures ('{}', '()', '[]') have been reclassified as operators.
    - Recognition of support functions and classes is currently missing.

Underneath that, the grammar is being written in CoffeeScript and converted into CSON format mostly so that remain I can remain sane while dealing with the regular expressions. However, it also affords the use of some handy organizational tools. See the documentation in the 'coffee' folder for more details.
