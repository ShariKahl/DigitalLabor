/*
 * Aufgabe_1_1.S
 *
 *  Created on: 12.10.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Zahlendarstellung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        mov R0, #0xFFFFFFF5 /* Lade hex #0xFFFFFFF5 in R0 */
        mov R1, #4294967285 /* Lade dec 4294967285 in R1 */
        mov R2, #-11        /* Lade dec -11 in R2 */
        mov R3, #-0xB       /* Lade hex -0xB in R3 */
        mov R4, #~10        /* Lade bin ~10 in R4 */
        mov R5, #0b11111111111111111111111111110101  /* Lade bin 0b11111111111111111111111111110101 in R5 */

stop:
	nop
	bal stop

.end
