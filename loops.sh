#!/bin/bash

# Experiments using while and for loops

echo "#1. While loop counter:"
i=1
while [ $i -le 3 ]
do
    echo Number: $i
    ((i++))
done

echo "#2. For loop counter:"
i=1
for i in {1..4}
do
    echo $i
done

echo "#3. List comprehension:"
list="red orange yellow"
echo "List: $list"
for color in $list
do
    echo "$color"
done

# echo "#4. Indefinite loop:"
# while :
# do
#     echo "<CTRL+C> to exit."
#     sleep 3
# done

echo "#5. Read file line by line:"
file=./inputs/colors.txt
echo "File: $file"
while read -r line
do
    echo "$line"
done < "$file"

echo "#6. Break statement:"
i=0
while [ $i -lt 5 ]
do
    echo "$i"
    ((i++))
    if [[ "$i" == '2' ]]; then
        break
    fi
done

echo "#7. Continue statement:"
i=0
while [ $i -lt 5 ]
do
    ((i++))
    if [[ "$i" == 2 ]]; then
        continue
    fi
    echo "$i"
done
