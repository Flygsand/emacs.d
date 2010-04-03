#!/bin/sh

emacs -batch -no-site-file -l init.el -f batch-byte-compile `find . -name "*.el"`

