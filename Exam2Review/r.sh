#!/bin/bash

# Compile addition.asm with NASM
nasm -g -F dwarf -f elf64 review2.asm -l review2.lst

# Link the object file to create executable
ld -g -o review2 review2.o

# Run the executable
./review2