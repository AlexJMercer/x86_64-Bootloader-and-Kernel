#!/bin/bash

if [ -z "$1" ];
then
    echo "Usage: $0 <file_name>"
    exit 1
fi

nasm -f bin $1.asm -o $1.bin

if [ $? -ne 0 ];
then
    echo "Assembly failed"
    exit 1
fi    

qemu-system-x86_64 $1.bin