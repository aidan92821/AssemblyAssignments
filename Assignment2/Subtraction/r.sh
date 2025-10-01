#!/bin/bash

# Compile addition.asm with NASM
nasm -f elf64 -g -F dwarf sub.asm -o sub.o

# Link the object file to create executable
ld -z noexecstack -g -o sub sub.o

# Run the executable
./sub