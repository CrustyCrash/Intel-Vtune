#!/bin/bash

echo "Enter the name of the module (e.g. vtune/latest): "
read -r name

while true; do
    if [[ ! -z "$name" ]]; then
        if module load "$name" 2>/dev/null; then
            echo "Module loaded successfully!"
            break
        else
            echo "Failed to load $name."
            echo "Try again."
        fi
    else
        echo "Module name cannot be empty"
        echo "Try again."
    fi
done
    


while true; do
    echo "Enter the path of the project directory: "
    read -r path
    if [[ -d "$path" ]]; then
        echo "Folder already exists."
        echo "Try again."
    else
        echo "Creating directory..."
        if mkdir -p "$path"; then
            echo "Output directory created successfully."
            break
        else
            echo "Failed to create directory. Please try again."
        fi
    fi
done


while true; do
    echo "Enter path for executable"
    read -r executable
    if [[ -f "$executable" ]]; then
        echo "Successfully found executable."
        break
    else
        echo "Failed to find executable. Please try again."
    fi
done

vtune --collect=hotspot --result-dir=$path -- $executable