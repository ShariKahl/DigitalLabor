/*
 * Aufgabe_2_1.S
 *
 *  Created on: 25.10.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : 64 Bit Addition
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
		/* Load the 64-bit values from R0-R3 */
		ldr r4, [r0]   /* Load lower 32 bits of the first number */
		ldr r5, [r1]   /* Load upper 32 bits of the first number */
		ldr r6, [r2]   /* Load lower 32 bits of the second number */
		ldr r7, [r3]   /* Load upper 32 bits of the second number */

		/* Perform the 64-bit addition */
		adds r8, r4, r6   /* Add the lower 32 bits */
		adc r9, r5, r7   /* Add the upper 32 bits with carry from the lower addition */
		adc r10, r10, #0  /* Add carry from the upper addition */

		/* r8 and r9 now hold the result, and r10 holds any overflow from the addition */

stop:
    nop
    bal stop

.end
