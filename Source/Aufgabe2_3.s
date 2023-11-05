/*
 * Aufgabe_2_3.S
 *
 *  Created on: 31.10.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Werte Binarisieren
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:


stop:
	nop
	bal stop

.end
