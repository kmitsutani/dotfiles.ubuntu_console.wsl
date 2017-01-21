#!/bin/bash
set -eux

gnubindir=$(brew --prefix coreutils)/libexec/gnubin

echo $gnubindir
find $gnubindir -type f |
while read command;
do
  echo $command
done
