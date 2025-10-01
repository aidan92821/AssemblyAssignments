#!/bin/bash

# Compile addition.asm with NASM
nasm -f elf64 -g -F dwarf add.asm -o add.o

# Link the object file to create executable
ld -z noexecstack -g -o add add.o

# Run the executable
./add