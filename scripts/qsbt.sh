#!/usr/bin/env bash

############
# QuickSBT #
############

# Launch SBT with support for generating /tmp/sbt.quickfix file for Vim
# http://github.com/aloiscochard / https://gist.github.com/4698501

# Error format for SBT, and shortcut to open SBT quickfix file :
# -----vim.rc-------
# set errorformat=%E\ %#[error]\ %#%f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C\ %#[error]\ %m
# set errorformat+=,%W\ %#[warn]\ %#%f:%l:\ %m,%-Z\ %#[warn]\ %p^,%-C\ %#[warn]\ %m
# set errorformat+=,%-G%.%#
# noremap <silent> <Leader>ff :cf /tmp/sbt.quickfix<CR>
# noremap <silent> <Leader>fn :cn<CR>

quickfix=/tmp/sbt.quickfix;\
sbt $@ | tee \
  >(while read line;\
    do \
      if echo "$line" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" | grep '\[error\]\|\[warn\]' >> ${quickfix}.raw;\
      then sed -n '/\^/{x;d;};1h;1!{x;p;};${x;p;}' ${quickfix}.raw > $quickfix; fi;\
    done > /dev/null\
  ) \
  >(clean=false; while read line; \
    do \
      if echo "$line" | grep '^> .*$'; then clean=true; fi;\
      if $clean; then rm ${quickfix}.raw 2> /dev/null; rm $quickfix 2> /dev/null; clean=false; fi;\
      if echo "$line" | grep 'Waiting for source changes'; then clean=true; fi \
    done > /dev/null\
  )
