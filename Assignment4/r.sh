#!/bin/bash

# Compile addition.asm with NASM
nasm -g -F dwarf -f elf64 leap.asm -l leap.lst

# Link the object file to create executable
ld -g -o leap leap.o

# Run the executable
./leap