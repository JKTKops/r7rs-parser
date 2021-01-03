# R7RS Parser

This repo contains an experimental parser for R7RS Scheme written for Haskell
using Alex and Happy. The plan is to use it in the future version of my project
Thcheme, but is not included there currently as Thcheme does not support all
of the features of R7RS that this parser is capable of accepting (such as complex
numbers).

This parser aims to parse all of R7RS-small Scheme. Currently, only bytevectors
and directives are outstanding. Attempting to parse a #!fold-case directive will
cause a lexical error. Unrecognized directives will be treated as errors when
they are added.

If you play with the parser and notice any bugs, please let me know!

(side note: Thcheme's name will almost certainly change before this parser is
integrated with it)