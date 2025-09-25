#!/bin/bash

# Compile addition.asm with NASM
nasm -g -F dwarf -f elf64 division.asm -l division.lst

# Link the object file to create executable
ld -g -o division division.o

# Run the executable
./division