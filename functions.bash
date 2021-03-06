#!/usr/bin/env bash
#   __                  _   _
#  / _|_   _ _ __   ___| |_(_) ___  _ __  ___
# | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#
# Shell function examples and boilerplate.
#
# The functions here are intended to be included in the interactive shell,
# which is done by defining them in a shell init file like `~/.bashrc`.
#
# Bash Boilerplate: https://github.com/alphabetum/bash-boilerplate
#
# Copyright (c) 2016 William Melody • hi@williammelody.com

###############################################################################
# Simple shell function with help / usage.
#
# This function provides an example of a simple shell function with help /
# usage information that is displayed with either the `-h` or `--help` flag.
###############################################################################

hello() {
  if [ "${1}" = "-h" ] || [ "${1}" = "--help" ]
  then
    cat <<HEREDOC
Usage:
  hello
  hello -h | --help

Options:
  -h --help  Display this usage information.

Description:
  Say hello.
HEREDOC
    return 0
  fi

  printf "Hello.\n"
}

###############################################################################
# Simple shell function with help / usage and option flags.
#
# This function provides an example of a simple shell function with help /
# usage information that is displayed with either the `-h` or `--help` flag.
# This example also demonstrates how to include an option flag to provide
# optional behavior. Only one option can be used at a time and it is expected
# to be in the first position.
###############################################################################

hi() {
  if [ "${1}" = "-h" ] || [ "${1}" = "--help" ]
  then
    cat <<HEREDOC
Usage:
  hi
  hi --all
  hi -h | --help

Options:
  --all      Say "hi" to everyone.
  -h --help  Display this usage information.

Description:
  Say hi.
HEREDOC
  elif [ "${1}" = "--all" ]
  then
    printf "Hi, everyone\!\n"
  else
    printf "Hi\!\n"
  fi
}

###############################################################################
# Simple wrapper with help / usage and option flags.
#
# This wrapper function provides an example of a simple wrapper for an
# existing command, adding help / usage information that is displayed with
# either the `-h` or `--help` flag. This example also demonstrates how to
# include an option flag to provide optional behavior. Only one option can be
# used at a time and it is expected to be in the first position.
#
# Wrapper functions are useful for adding functionality and options to an
# existing command, or even simply adding usage information to a command that
# doesn't otherwise provide it.
###############################################################################

# Save the existing `yes` exectuable path to a variable so it can be used
# after the name `yes` is redefined.
_YES_COMMAND="$(which yes)"
yes() {
  if [ "${1}" = "-h" ] || [ "${1}" = "--help" ]
  then
    cat <<HEREDOC
Usage:
  yes [<expletive>]
  yes --quiet
  yes -h | --help

Options:
  --quiet    Suppress output.
  -h --help  Display this usage information.

Description:
  A wrapper for \`yes\`, which outputs <expletive> or, by default, 'y' forever.
  For more information, run \`man yes\`.
HEREDOC
  elif [ "${1}" = "--quiet" ]
  then
    "${_YES_COMMAND}" "${@}" 1> /dev/null
  else
    "${_YES_COMMAND}" "${@}"
  fi
}
