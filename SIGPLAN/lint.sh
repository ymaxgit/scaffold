#!/bin/bash

# David Terei's lint for latex spelling and grammar
# http://public.wsu.edu/~brians/errors/

# Manual TODO:
# spelling
# function vs symbol
# \tt Vs \texttt Vs \hssp Vs $$
# trustworthy, safe Vs \texttt{Trustworthy}...
# RIO Vs \hssp{RIO}
# check tense

GREP="grep -Hn -E"
GREPI="$GREP -i"

$GREP "haskell" *.tex | grep -v 'cite{haskell' | grep -v 'cite{tryhaskell' # should be Haskell
$GREP "\bghc\b" *.tex | grep -v 'sec:ghc' | grep -v 'cite{ghc' | grep -v 'ghc.io' # should be GHC
$GREP "\bghci\b" *.tex | grep -v "sec:ghci"
$GREP "I/O" *.tex # Should be IO
$GREP "consumer" *.tex # generally should be user
$GREP "\$C\$" *.tex # generally should be U

$GREP -i "[^\\]dede" *.tex | grep -v '\\newcommand'
$GREP " ~\\|^~" *.tex
$GREP "[0-9][GMK][^B^b^H]" *.tex
$GREP "	" *.tex # tabs

# todos
$GREP "[\]XXX" *.tex | grep -v '\\newcommand' | grep 'XXX'
$GREP "[\]DAT" *.tex | grep -v '\\newcommand' | grep 'DAT'
$GREP "[\]SDM" *.tex | grep -v '\\newcommand' | grep 'SDM'
$GREP "[\]SPJ" *.tex | grep -v '\\newcommand' | grep 'SPJ'
$GREP "[\]Red" *.tex | grep -v '\\newcommand' | grep 'Red'
$GREP "[\]nb" *.tex | grep -v '\\newcommand' | grep 'nb'
$GREP "[\]ToDo" *.tex | grep -v '\\newcommand' | grep 'ToDo'

# use UK spelling...
$GREPI "recognizes" *.tex
$GREPI "formalize" *.tex
$GREPI "authorized" *.tex
$GREPI "optimized" *.tex
$GREPI "generalized" *.tex | grep -v 'LANGUAGE Generalized'
$GREPI "behavior" *.tex
$GREPI "labeling" *.tex # labelling
$GREPI "labeled" *.tex # labelled

# Spelling
$GREPI "incluiding" *.tex # including
$GREPI "infered" *.tex # inferred
$GREPI "funciton" *.tex # function
$GREPI "seperation" *.tex # separation
$GREPI "seperate" *.tex # separate
$GREP  "internet" *.tex # Internet

# Serial comma? US english says mostly yes, UK/AUS says no...
$GREPI ", and" *.tex
#$GREPI "[^,] and" *.tex

# Grammar...
$GREPI "build of" *.tex # build on
$GREPI "builds of" *.tex # builds on
$GREPI "later case" *.tex # latter case
$GREPI "server side" *.tex # server-side

# Argh! backward-compatible stuff...
$GREPI "backwards" *.tex # probably backward
$GREPI "backwards compatability" *.tex # backward compatability
$GREPI "non backward" *.tex # non-backward
# use: non-backward-compatible
# use: nonbackward compatibility
# use: backward-compatible
# use: backward compatibility

# Be careful how I use client / server. client should be a remote untrusted
# party providing code to the server, it should in general refer to the user
# running GHC.
#$GREPI "client" *.tex
#$GREPI "server" *.tex
#$GREPI "user" *.tex

# safe language vs safe subset.
# need to go with one....
#$GREPI "safe language" *.tex
#$GREPI "safe subset" *.tex
$GREPI "safe dialect" *.tex
#$GREPI "safe subset" *.tex
$GREPI "safe language subset" *.tex
$GREPI "safe language dialect" *.tex

# Argh all the confusing type... things
$GREPI "type safe\b" *.tex # type-safe
$GREPI "type-safety" *.tex # type safety
$GREPI "type-system" *.tex # type system
$GREPI "type theoretic" *.tex # type-theoretic
$GREPI "well typed" *.tex # well-typed
$GREPI "type checker" *.tex # typechecker
$GREPI "type-checker" *.tex # typechecker

# Variations...
$GREPI "type class" *.tex
$GREPI "type-class" *.tex
$GREPI "offline" *.tex # off-line
$GREPI "offload" *.tex # off-load
$GREPI "information flow" *.tex # information-flow control

# Informal
$GREPI "can not" *.tex # cannot, although both are correct
$GREPI "couldn't" *.tex # could not
#$GREP "you" *.tex
#$GREP "your" *.tex
$GREPI "Let's" *.tex
$GREPI "let's" *.tex
$GREPI "don't" *.tex
$GREPI "won't" *.tex
$GREPI "can't" *.tex
$GREPI "haven't" *.tex
$GREPI "shouldn't" *.tex
$GREPI "wouldn't" *.tex
#$GREP "will" *.tex
#$GREP "so " *.tex
#$GREP "whose" *.tex

exit 0
