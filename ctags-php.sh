  1 #!/bin/bash
  2 ctags -f ./tags \
  3   -h \".php\" -R \
  4   --exclude=\"\.svn\" \
  5   --exclude=\"*\.js\" \
  6   --totals=yes \
  7   --tag-relative=yes \
  8   --PHP-kinds=+cf \
  9   --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
 10   --regex-PHP='/interface ([^ ]*)/\1/c/' \
 11   --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'
