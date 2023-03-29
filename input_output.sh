#!/bin/bash

# Experiments using inputs / outputs

# Notes
# - When reading txt file line by line, the last line 
#   must be empty for last element to be read

echo "#1. Read file line by line"
while read -r line
do
  echo "$line"
done < ./inputs/colors.txt

echo "#2. Write to file"
# Overwrite file if exists
echo "Here is some text." > ./outputs/some_text.txt
# Append to file. Create if doesn't exist
echo "And more text." >> ./outputs/some_text.txt

echo "#3. Touch command"
file=./outputs/new_file.txt
# Create new file if doesn't already exist
touch $file
echo "Hello new file." > $file
echo "Hello new new file." > $file
echo "Second line." >> $file