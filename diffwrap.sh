#!/bin/sh
# svn diff use vimdiff config
DIFF="vimdiff"
# SVN diff
LEFT=${6}
RIGHT=${7}
#
$DIFF $LEFT $RIGHT
