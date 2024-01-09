/*
 * Aufgabe_1_2.S
 *
 *  Created on: 12.10.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Addition von Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        /* a) */
        mov R0, #11
        mov R1, #4294967285
        add R2, R0, R1 

        /* b) */
        mov R3, #1
        mov R4, #~0
        add R5, R3, R4

        /* c) */
        mov R6, #1<<31 //2147483648
        mov R7, #2147483648
        add R8, R6, R7

stop:
	nop
	bal stop

.end
