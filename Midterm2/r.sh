#!/bin/bash

# Compile addition.asm with NASM
nasm -g -F dwarf -f elf64 exam2.asm -l exam2.lst

# Link the object file to create executable
ld -g -o exam2 exam2.o

# Run the executable
./exam2