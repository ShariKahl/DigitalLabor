/*
 * Aufgabe_2_1.S
 *
 *  Created on: 05.11.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : 64 Bit Addition
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
		/* Initialize registers */
		mov r8, #0  /* Clear result for lower 32 bits */
		mov r9, #0  /* Clear result for upper 32 bits */
		mov r10, #0 /* Clear carry register */

		/* First addition: Add the least significant 32-bit words */
		ldr r0, [R0] /* Load the first 32-bit word from memory into r0 */
		ldr r1, [R1] /* Load the second 32-bit word from memory into r1 */
		adds r8, r0, r1 /* Add r0 and r1, result in r8 */

		/* Check for carry */
		adc r10, #0 /* Add carry to r10 */

		/* Second addition: Add the most significant 32-bit words */
		ldr r2, [R2] /* Load the third 32-bit word from memory into r2 */
		ldr r3, [R3] /* Load the fourth 32-bit word from memory into r3 */
		adds r9, r2, r3 /* Add r2 and r3, result in r9 */

		/* Check for carry */
		adc r10, r10, #0 /* Add carry to r10 */

		/* Third addition: Add the carry from the second addition */
		adc r9, r10, r9 /* Add carry to the upper 32 bits */

		/* r8 and r9 now hold the result of the 64-bit addition */
    
stop:
    nop
    bal stop

.end