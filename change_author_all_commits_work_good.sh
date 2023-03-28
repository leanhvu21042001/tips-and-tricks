#!/bin/sh
  2
  3 git filter-branch --env-filter '
  4
  5 OLD_EMAIL="your-old-email@example.com"
  6 CORRECT_NAME="Your Correct Name"
  7 CORRECT_EMAIL="your-correct-email@example.com"
  8
  9 if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
 10 then
 11     export GIT_COMMITTER_NAME="$CORRECT_NAME"
 12     export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
 13 fi
 14 if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
 15 then
 16     export GIT_AUTHOR_NAME="$CORRECT_NAME"
 17     export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
 18 fi
 19 ' --tag-name-filter cat -- --branches --tags
