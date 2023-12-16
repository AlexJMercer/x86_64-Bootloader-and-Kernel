
## 13. Compilers

> If we want our OS to run on various different platforms, we can't just compile our code with the same compiler used for *our* machine/platform. <br>We need to use a compiler that can compile our code specifically for the platform we want to run it on.
>
> Here's where **Cross-Compilers** come in. They are compilers that can compile code for a different platform than the one they are running on.
>
> In this case, we need a compiler that can compile our code for the `x86` architecture. We can use the `GCC` compiler for this purpose.


## 14. Writing a Kernel...

> What's a kernel you say?
>
> Well, a kernel is a program that is loaded into memory when the computer starts up. It is the first program that is run when the computer starts up. It is the program that manages the computer's resources and allows other programs to run on it.
>
> The full code can be found under the <a href="../src">`src`</a> directory.

### 14.1. The Kernel

> The kernel handles everything from *interrupts*, *exceptions*, *system calls*, to *memory management* and so on.
>
> We'll be writing a simple kernel that prints a character to the screen. This is defined in the <a href="../src/kernel.c">`kernel.c`</a> file.
>
> Then we define a file that will be the entry point for our kernel. This is defined in the <a href="../src/kernel_entry.asm">`kernel_entry.asm`</a> file.