/*
 * Aufgabe_2_3.S
 *
 *  Created on: 07.11.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Werte Binarisieren
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
		/* Register zur Speicherung der binarisierten Werte initialisieren */
		MOV R0, #0

		/* Datenmenge auf 8 initialisieren */
		MOV R1, #8

		/* Datenzeiger initialisieren (Annahme: Speicheradresse 0x1000) */
		LDR R2, =0x1000

		/* Schleife zur Binarisierung der Daten */
		binarize_loop:
			/* Wert aus dem Speicher laden */
			LDR R3, [R2]

			/* Datenzeiger auf die nächste Adresse verschieben */
			ADD R2, R2, #4

			/* Prüfen, ob der Wert größer als der Schwellenwert ist (z.B., 0x80000000) */
			CMP R3, #0x80000000
			MOVHI R3, #1   /* Wenn der Wert größer ist, setze ihn auf 1 */
			MOVLS R3, #0   /* Andernfalls setze ihn auf 0 */

			/* Binarisierten Wert mit dem Register R0 verodern */
			ORR R0, R0, R3

			/* Register R0 um ein Byte (8 Bit) nach links verschieben */
			LSL R0, R0, #8

			/* Verringere die Datenmenge um 1 */
			SUBS R1, R1, #1

			/* Schleifenbedingung prüfen (Datenmenge > 0) */
			BGT binarize_loop

stop:
    nop
    bal stop

.end
