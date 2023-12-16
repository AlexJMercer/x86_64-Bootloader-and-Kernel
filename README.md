<h1 align="center">Beginners Attempt at OSDev</h1>
<h3 align="">⚠️In progress</h3>

<h3 align="center"> 

![Alt text](/Instructions%20&%20Notes/img/image-5.png)
</h3>

## Introduction

> This is an attempt at understanding how computers work.<br>
> How an Operating system operates, and how it interfaces with bare metal hardware.<br>
>
> I'm also making a collection of detailed notes and instructions for myself, and anyone else who wants to follow along on this journey.<br>
> 
> You can access the notes in the [Instructions & Notes](/Instructions%20&%20Notes) folder.<br>
> The notes are written in Markdown, and can be viewed on GitHub itself.
>
> Please click <a href="/Instructions & Notes/starter-notes.md">here</a> to begin reading the notes.
>


## Environment Setup

> I'm using a Windows 11 64-bit machine, and here's what you will need to get started.
> 
> - **NASM** : Install this through winget using `winget install nasm`. This is to help us assemble our code, i.e, convert our assembly code to machine code.
> - **QEMU** : Install this through winget using `winget install qemu`, or download it from <a href="https://www.qemu.org/download/">here</a>. QEMU is essentially a Virtual Machine, and we will use it to run our boot sector and boot into our OS.
> - **Preferred IDE** : I'm using **VSCode** 💖 as it's simple and easy to use with Git. You can use any IDE you want, or even a simple text editor like Notepad++ or Sublime Text.
>
> - **Additionally**, you may create a Shell script to automatically generate your `.asm` file into a `.bin` file, and then run it on QEMU.<br>
I've implemented it using **BASH**, in a file called `run.sh`. You can use it by running `bash run.sh <filename>` in your Windows Terminal.<br>
>
> **NOTE :** You will need to have WSL installed on your machine to use this script. Also, you will need to have QEMU and NASM installed in your WSL environment as well.
>
> **Alternatively**, you can use the `run.bat` like so: `run.bat <filename>`. This will generate a `output.bin` file and run it on QEMU.

## Building the files

> For sake of simplicity and convenience, I've chosen to build and run the final file in **`WSL`**.
>
> I have included a long list of dependencies and instructions in the `setup-g++-wsl.sh` file in the <a href="./src/">`src`</a> folder. You can run this file to install all the dependencies at once.<br> **Just in case**, the script fails, you should be able to install the dependencies by manually typing the commands one by one.
>
> **NOTE :** You can simply open your current working directory inside of WSL by typing `bash` in the CMD.

> Once the prerequisites are installed, you can proceed to run the `build.sh` file which will automagically build the files for you and place them in the `bin` folder & run them on QEMU.<br>