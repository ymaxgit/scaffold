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

# use en dashes, not em, and should be spaced
$GREPI "\-\-\-" *.tex
$GREPI "[a-zA-Z0-9]\-\-[a-zA-Z0-9]" *.tex

# don't space footnote
$GREPI "~\\\\footnote" *.tex

# no tabs
$GREP "	" *.tex


###########################################################
# TODOS

$GREP "[\]XXX" *.tex | grep -v '\\newcommand' | grep 'XXX'
$GREP "[\]Red" *.tex | grep -v '\\newcommand' | grep 'Red'
$GREP "[\]nb" *.tex | grep -v '\\newcommand' | grep 'nb'
$GREP "[\]ToDo" *.tex | grep -v '\\newcommand' | grep 'ToDo'


###########################################################
# SPELLING

# use UK spelling...
$GREPI "recognizes" *.tex
$GREPI "formalize" *.tex
$GREPI "authorized" *.tex
$GREPI "optimized" *.tex
$GREPI "generalized" *.tex | grep -v 'LANGUAGE Generalized'
$GREPI "behavior" *.tex
$GREPI "labeling" *.tex # labelling
$GREPI "labeled" *.tex # labelled

# common mistakes
$GREPI "incluiding" *.tex # including
$GREPI "infered" *.tex # inferred
$GREPI "funciton" *.tex # function
$GREPI "seperation" *.tex # separation
$GREPI "seperate" *.tex # separate
$GREP  "internet" *.tex # Internet
$GREP  "[^/:]memcached" *.tex # Memcached
$GREPI "memcache\b" *.tex # Memcached
$GREPI "run-time[s]\b" *.tex # runtime[s]


###########################################################
# COMMA

# Serial comma? US english says mostly yes, UK/AUS says no...
$GREPI ", and" *.tex             # UK/AUS
# $GREPI "[^,] and" *.tex        # US


###########################################################
# GRAMMAR

$GREPI "build of" *.tex # build on
$GREPI "builds of" *.tex # builds on
$GREPI "later case" *.tex # latter case
$GREPI "server side" *.tex # server-side
$GREPI "pre-emption" *.tex # preemption
$GREPI "non-determinism" *.tex # nondeterminism

###########################################################
# CONSISTENT WORD CHOICE

# Google Trends = data center 3x more popular than datacenter...
$GREPI "datacenter" *.tex # data center

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


###########################################################
# TECHNICAL LANGUAGE

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
$GREP  "I/O" *.tex # Should be IO
$GREPI "consumer" *.tex # generally should be user

# link lists -- not linked-lists. 
$GREPI "linked-l" *.tex


###########################################################
# END

exit 0

