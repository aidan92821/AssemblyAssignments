#!/bin/bash

# Compile addition.asm with NASM
nasm -g -F dwarf -f elf64 add.asm -l add.lst

# Link the object file to create executable
ld -g -o add add.o

# Run the executable
./add