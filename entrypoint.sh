#!/usr/bin/env bash
if [ "$1" == "notokenize" ]
then
  cat - | sed G | tr ' ' '\n' | ftb-label 2>tmp
else
  # Tokenize by default
  cat - | python3 src/my_tokenize.py | ftb-label 2>tmp
fi
