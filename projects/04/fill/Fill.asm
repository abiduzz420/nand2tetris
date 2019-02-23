// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite BLACKEN_LOOP that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// display unit 256 rows, 512 columns
// To go to next row: addr = addr + 32

(INIT)
    @i
    M = 0
    @SCREEN
    D = A
    @addr
    M = D
    @KBD
    D = M    
    @BLACKEN_LOOP
    D;JNE

(WHITEN_LOOP)
    @i
    D = M
    @8191
    D = D - A
    @INIT
    D;JGT

    @addr
    A = M
    M = 0

    @i
    M = M + 1

    @1
    D = A

    @addr
    M = M + D

    @WHITEN_LOOP
    0;JMP

(BLACKEN_LOOP)
    @i
    D = M
    @8191
    D = D - A
    @INIT
    D;JGT

    @addr
    A = M
    M = -1

    @i
    M = M + 1

    @1
    D = A

    @addr
    M = M + D

    @BLACKEN_LOOP
    0;JMP