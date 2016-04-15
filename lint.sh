#!/bin/bash

# David Terei's lint for latex spelling and grammar
# http://public.wsu.edu/~brians/errors/
# http://www.read.seas.harvard.edu/~kohler/latex.html

# Manual Steps:
# * spelling
# * function vs symbol
# * \tt Vs \texttt Vs \hssp Vs $$
# * check tense


###########################################################
# GREP CONFIGURATION

GREP="grep -Hn -E"
GREPI="$GREP -i"


###########################################################
# LATEX MISTAKES
echo "=> Latex Errors"

# use em dashes, not en, and should be spaced
# $GREPI " \-\- " *.tex

# don't space footnote
$GREPI "~\\\\footnote" *.tex

# no tabs
$GREP "	" *.tex


###########################################################
# TODOS
echo "=> TODO"

$GREP "[\]XXX" *.tex | grep -v '\\newcommand' | grep 'XXX'
$GREP "[\]Red" *.tex | grep -v '\\newcommand' | grep 'Red'
$GREP "[\]nb" *.tex | grep -v '\\newcommand' | grep 'nb'
$GREP "[\]ToDo" *.tex | grep -v '\\newcommand' | grep 'ToDo'


###########################################################
# SPELLING
echo "=> Spelling"

# use US spelling...
$GREPI "recognises" *.tex
$GREPI "formalise" *.tex
$GREPI "authorised" *.tex
$GREPI "optimised" *.tex
$GREPI "generalised" *.tex
$GREPI "behaviour" *.tex
$GREPI "labelling" *.tex # labeling
$GREPI "labelled" *.tex # labeled
$GREPI "minimised" *.tex
$GREPI "[^\\{=]centre" *.tex

# common mistakes
$GREPI "canot" *.tex # cannot
$GREPI "incluiding" *.tex # including
$GREPI "infered" *.tex # inferred
$GREPI "funciton" *.tex # function
$GREPI "seperation" *.tex # separation
$GREPI "seperate" *.tex # separate
$GREP  "[^/:{-]memcached\b" *.tex # Memcached
$GREPI "[^{-]memcache\b" *.tex # Memcached

# Hyphens
$GREPI "run-time[s]\b" *.tex # runtime[s]
$GREPI "ad-hoc" *.tex # ad hoc -- no hyphen in latin
$GREPI "pre-emption" *.tex # preemption
$GREPI "non-determinism" *.tex # nondeterminism
$GREPI "tail latency" *.tex # tail-latency
$GREPI "tail latencies" *.tex # tail-latencies
$GREPI "server side" *.tex # server-side

# Capitalize
$GREP  "internet" *.tex # Internet


###########################################################
# COMMA

# don't check any more as serial comma is not a hard rule, sometimes
# make sense, just need to be consistent.

# Serial comma? US english says mostly yes, UK/AUS says no...
# $GREPI ", and" *.tex           # UK/AUS
# $GREPI "[^,] and" *.tex        # US

# Not bad but choose one style
$GREP "i\.e\.[^,]" *.tex # Should be i.e.,
$GREP "e\.g\.[^,]" *.tex # Should be e.g.,


###########################################################
# GRAMMAR
echo "=> Grammar"

$GREPI "build of" *.tex # build on
$GREPI "builds of" *.tex # builds on
$GREPI "later case" *.tex # latter case


###########################################################
# CONSISTENT WORD CHOICE
echo "=> Word Choice"

# Google Trends = data center 3x more popular than datacenter...
$GREPI "[^-]datacenter" *.tex # data center

# Argh! backward-compatible stuff...
$GREPI "backwards" *.tex # probably backward
$GREPI "backwards compatability" *.tex # backward compatability
$GREPI "non backward" *.tex # non-backward
# use: non-backward-compatible
# use: nonbackward compatibility
# use: backward-compatible
# use: backward compatibility


###########################################################
# INFORMAL LANGUAGE
echo "=> Informal"

$GREPI "can not" *.tex # cannot, although both are correct
$GREPI "couldn't" *.tex # could not
$GREPI "you\b" *.tex
$GREPI "your\b" *.tex
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


###########################################################
# TECHNICAL LANGUAGE
echo "=> Technical Language"

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
$GREP  "I/O" *.tex # Should be IO
$GREPI "consumer" *.tex # generally should be user
$GREPI "information-flow" *.tex # information flow

# link lists -- not linked-lists. 
$GREPI "linked-l" *.tex

# hyphens - http://www.economist.com/style-guide/hyphens
# ap & chicago - http://www.apvschicago.com/
$GREPI "\boff-line\b" *.tex # offline
$GREPI "\bon-line\b" *.tex # online
$GREPI "offload" *.tex # off-load
$GREPI "[^-]realtime" *.tex # real-time
$GREPI "pause-time" *.tex # pause time
$GREPI "co-ordinate" *.tex # coordinate
# trade-off (both OK, but hyphen more common)
$GREPI "\btradeoff" *.tex | grep -v ":tradeoff"
$GREPI "screen-shot" *.tex # screenshot
$GREPI "screen shot" *.tex # screenshot
$GREPI "\bmulticore\b" *.tex # multi-core


###########################################################
# TECHNICAL LANGUAGE
echo "=> Names"

$GREPI "Map Reduce" *.tex # MapReduce
$GREP "(^| )haskell\b" *.tex # should be Haskell
$GREP "\bghc\b" *.tex | grep -v 'sec:ghc' | grep -v 'cite{ghc' | grep -v 'ghc.io' # should be GHC
$GREP "\bghci\b" *.tex | grep -v "sec:ghci"


###########################################################
# PAPER SPECIFIC


###########################################################
# END

exit 0
