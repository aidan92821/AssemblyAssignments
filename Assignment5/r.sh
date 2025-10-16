#!/bin/bash

# Compile addition.asm with NASM
nasm -g -F dwarf -f elf64 parity.asm -l parity.lst

# Link the object file to create executable
ld -g -o parity parity.o

# Run the executable
./parity