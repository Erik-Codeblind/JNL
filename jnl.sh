#!/bin/sh
cd "$(dirname "$0")"
. ./CONFIG.sh
if [ ! -z "$FILES_DIR" ] &&
   [ ! -z "$EDITOR_APP" ] &&
   [ ! -z "$FILE_EXT" ] &&
   [ -d "$FILES_DIR" ]
then
  TIMESTAMP=0
  DATE=$(date +"%Y/%m")
  while test $# -gt 0
  do
   case "$1" in
    --last) LAST=1
    ;;
    --new) TIMESTAMP=$(date +"%s")
    ;;
    --no-timer) TIMER=0
    ;;
    esac
    shift
  done
  if [ $LAST -eq 1 ];then
    FILE=$FILES_DIR/$DATE/$(ls "$FILES_DIR/$DATE" | tail -1)
  else
    mkdir -p $FILES_DIR/$DATE
    FILE=$FILES_DIR/$DATE/$(date +%d).$TIMESTAMP.$FILE_EXT
    touch $FILE
  fi
  open -a $EDITOR_APP $FILE

  if [ "$TIMER" -gt 0 ];then
    while [ $TIMER -gt 0 ]; do
        mins=$((TIMER / 60));
        secs=$((TIMER - (mins * 60)));
        printf "\e[1m $mins m $secs s \r\e[0m"
        sleep 1
        : $((TIMER--))
    done
    osascript -e "tell app \"System Events\" to display dialog \"$ALERT_MESSAGE\""
  fi

else
  echo "Configuration error."
  exit 1;
fi
