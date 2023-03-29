#!/bin/bash

# Experiments using functions

# Notes:
# - all variables by default are global, even if declared in function.
# - use `local` to declare local variables within functions.
# - bash functions don't allow values to be returned. Only an exit status.


echo "#1. Syntax options for functions"
function hello_world {
   echo "Hello World!"
}

hello_also () {
    echo "Alt function syntax."
}

hello_world
hello_also


echo "#2. Variable scopes"
var1='A'
var2='B'

function var_scopes {
  local var1='C'
  var2='D'
  echo "Inside function: var1: $var1, var2: $var2"
}

echo "Before executing function: var1: $var1, var2: $var2"
var_scopes
echo "After executing function: var1: $var1, var2: $var2"


echo "#3. Returns"
# Only exit status values 0 - 255 are returnable
function returns {
    echo "Return test"
    return 42
}
returns
echo $?


echo "#4. Passing arguments"
function greeting1 {
    echo "Hello $1"
}

greeting1 John Jacob

echo "#5. Passing * vs. @"
function arguments1 {
    echo "Number of args: $#"
    echo Arg: "$@"
}

arguments1 "arg1" "arg2"

function arguments2 {
    echo "Number of args: $#"
    for x in "$@"
    do
        echo "Arg: $x"
    done
}

arguments2 "arg1" "arg2"

function arguments3 {
    echo "Number of args: $#"
    for x in $*; do
        echo "Arg: $x"
    done
}

arguments3 "arg1" "arg2"