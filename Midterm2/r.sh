#!/bin/bash

# Compile addition.asm with NASM
nasm -g -F dwarf -f elf64 review1.asm -l review1.lst

# Link the object file to create executable
ld -g -o review1 review1.o

# Run the executable
./review1