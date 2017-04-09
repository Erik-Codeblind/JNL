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

  if [ "$TIMER" -gt 0 ];then
    while [ $TIMER -gt 0 ]; do
        printf "$TIMER\r"
        sleep 1
        : $((TIMER--))
    done
    osascript -e "tell app \"System Events\" to display dialog \"$ALERT_MESSAGE\""
  fi

else
  echo "Configuration error."
  exit 1;
fi
