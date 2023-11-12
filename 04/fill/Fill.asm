// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

    // max = 24575
    @24575
    D=A
    @max
    M=D

    // cur = SCREEN
    @SCREEN
    D=A
    @cur
    M=D

(LOOP)
    @KBD
    D=M
    @FILL
    D;JGT
    @CLEAR
    0;JMP

(FILL)
    @max
    D=M
    @cur
    D=D-M

    @LOOP
    D;JLT

    @cur
    A=M
    M=-1

    @cur
    M=M+1

    @LOOP
    0;JMP
(CLEAR)
    @SCREEN
    D=A
    @cur
    D=D-M
    @LOOP
    D;JGT

    @cur
    A=M
    M=0

    @cur
    M=M-1

    @LOOP
    0;JMP
