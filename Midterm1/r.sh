#!/bin/bash

# Compile addition.asm with NASM
nasm -g -F dwarf -f elf64 exam1.asm -l exam1.lst

# Link the object file to create executable
ld -g -o exam1 exam1.o

# Run the executable
./exam1