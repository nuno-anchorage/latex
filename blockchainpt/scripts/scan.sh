#!/bin/bash

# clear file
echo -n > sections.tex

# scan dir
for filepath in sections/*; do
    filename=$(basename -- "$filepath")
    stem="${filename%.*}"
    extension="${filename##*.}"
    
    # append import statement
    if [ $extension == "tex" ]; then
        echo "\input{sections/${stem}.tex}" >> sections.tex
    fi
done