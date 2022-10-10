# Assembly Challenges

This repository contains assembly challenges.

## X86 Aliases

You can use aliases for making work easier. 

### Build Specific Assembly
Use "asmb" for build assembly file. 
It will generate an executable file.

```sh	
alias asmb='function _(){ nasm -f elf32 -o $1.o $1.asm && ld -m elf_i386 -o $1 $1.o; }; _'
```

Example:
```sh
cd 001_write_stdout
asmb write
./write
```

### Build and Run Specific Assembly
Use "asmr" for build assembly file and run it with specific filename. 
It will generate an executable file and run it.

```sh
alias asmr='function _(){ nasm -f elf32 -o $1.o $1.asm && ld -m elf_i386 -o $1 $1.o && ./$1; }; _'
```

Example:
```sh
cd 001_write_stdout
asmr program
```


### Build and Run Pre-Defined Assembly

If your filename is "program.asm" you can use "asm" alias.

```sh
alias asm='function _(){ nasm -f elf32 -o program.o program.asm && ld -m elf_i386 -o program program.o && ./program; }; _'
```

Example:
```sh
cd 001_write_stdout
asm
```