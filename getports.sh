#!/bin/bash
if [ -z $1 ]
then
  echo "Error, no argumments!";
  exit 1;
elif ! [ -f $1 ]
then
  echo "Error, no regular file!";
  exit 1;
fi
dataports=$(cat $1 | grep -oP '[0-9]{1,5}/open' | awk -F / '{print $1}' | xargs | tr ' ' ',')
ipdata=$(cat $1 | awk FNR==3 | cut -d " " -f2)
echo "(*) Proccessig data..."
echo -e "\t(*) IP Address\t: $ipdata"
echo -e "\t(*) Ports\t: $dataports"
echo $dataports | tr -d '\n' | xclip -sel clip
echo "(*) Ports copied to clipboard!"
