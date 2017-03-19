#!/bin/sh
cd "$(dirname "$0")"
. ./CONFIG.sh
if [ ! -z "$FILES_DIR" ] &&
   [ ! -z "$EDITOR_APP" ] &&
   [ ! -z "$FILE_EXT" ] &&
   [ -d "$FILES_DIR" ]
then
  mkdir -p $FILES_DIR/$(date +"%Y/%m")
  NEW_FILE=$FILES_DIR/$(date +"%Y/%m/%d").$FILE_EXT
  touch $NEW_FILE
  open -a $EDITOR_APP $NEW_FILE
else
  echo "Configuration error."
  exit 1;
fi
