#! /bin/bash

# List the contents of the Textbooks folder but ignore the archive folder.
choice="$(ls -I Archive ~/Documents/Textbooks | dmenu -l 20)"

# As long as the choice is not NULL then open the textbook.
if [ "X$choice" != "X" ]
then
  dir="~/Documents/Textbooks/"
  i3-msg exec --no-startup-id okular $dir$choice
fi