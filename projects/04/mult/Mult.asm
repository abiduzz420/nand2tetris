// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// R2 = R0 * R1

// R0 = 6
// R1 = 7
// R2 = 0
// i = 1
// for(i=1;i<=R1;i++) {
//     R2 = R2 + R0;
// }


    @R0
    D = M
    @val
    M = D
    @R1
    D = M
    @maxcount
    M = D
    @count
    M = 0
    @sum
    M = 0

    @R0
    D = M
    @END
    D;JEQ
    
    @R1
    D = M
    @END
    D;JEQ

(LOOP)
    @count
    D = M
    @maxcount
    D = M - D
    @END
    D;JEQ
    @val
    D = M
    @sum
    M = M + D
    @count
    M = M + 1
    @LOOP
    0;JMP
(END)
    @sum
    D = M
    @R2
    M = D
    @END
    0;JMP