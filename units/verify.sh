#!/bin/bash

lesson_file=$1
cmd_delimiter=\|
error_regex="Error performing request.*"

function exitWithError() {
  echo "$1 | $2 | $3"
  exit 1
}

function sendCommand() {
  #Avoid sending the same command two times in a row
  if [[ $1 != $previous_cmd ]]; then
    cmd_result=$($1)
    while [[ $cmd_result =~ $error_regex ]]; do
      sleep 5
      cmd_result=$($1)
    done
    previous_cmd=$1
  fi
}

while read cmd_config; do
  #Lines that start with > are directives (commands that executes)
  if [[ ${cmd_config:0:1} == ">" ]]; then
    cmd_config=$(echo $cmd_config | cut -c2-)
    cmd_result=$(${cmd_config})
  #Lines that begin with # are comments
  elif [[ ${cmd_config:0:1} != "#" ]]; then
    cmd=$(echo $cmd_config | cut -f1 --delimiter=$cmd_delimiter)
    regex=$(echo $cmd_config | cut -f2 --delimiter=$cmd_delimiter)
    message=$(echo $cmd_config | cut -f3 --delimiter=$cmd_delimiter)

    #Value is stored in variable cmd_result
    sendCommand "$cmd"

    #Regex that begins with !! are negative expressions
    if [[ ${regex:0:2} == "!!" ]]; then
      #Remove first two chars (!!) to make a valid regex
      regex=$(echo $regex | cut -c3-)
      if [[ $cmd_result =~ $regex ]]; then
        exitWithError "$cmd" "$regex" "$message"
      fi
    else
      if ! [[ $cmd_result =~ $regex ]]; then
        exitWithError "$cmd" "$regex" "$message"
      fi
    fi
  fi
done <$lesson_file
