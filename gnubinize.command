#!/bin/bash
set -eux

gnubindir=$(brew --prefix coreutils)/libexec/gnubin

find $gnubindir -type f
