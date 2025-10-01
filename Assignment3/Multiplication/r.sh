#!/bin/bash

# Compile addition.asm with NASM
nasm -g -F dwarf -f elf64 multiplication.asm -l multiplication.lst

# Link the object file to create executable
ld -g -o multiplication multiplication.o

# Run the executable
./multiplication