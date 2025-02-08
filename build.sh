#!/bin/bash

echo "compiling"

gcc src/main.c -lraylib -o bin/main 2>&1 | tee log # Capture output for later use

if [ $? -eq 0 ]; then
  clear
  echo "Compilation successful!"
  ./bin/main # Run the program if successful
elif [ $? -eq 127 ]; then # command not found
    clear
    echo "gcc command not found"
    exit 1
else
  clear
  echo "Compilation failed!"
  cat compile_output.txt # Print the captured error messages
  exit 1
fi
