#!/bin/bash
#author: Farid Karami

# Define the directory path
directory="./src"

# Define the old and new strings
old_string="website.com"
new_string="another.org"

# Replace old string with new string in filenames and directories
find "$directory" -depth -name "*$old_string*" | while read -r entry; do
    new_entry="${entry//$old_string/$new_string}"
    if [[ "$entry" != "$new_entry" ]]; then
        mv "$entry" "$new_entry"
    fi
done

# Replace occurrences inside files
find "$directory" -type f -exec sed -i "s/$old_string/$new_string/g" {} +