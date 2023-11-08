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
		/* Register zur Speicherung der binarisierten Werte initialisieren */
		MOV R0, #0

		/* Speicheradresse der ersten 32-Bit-Zahl (Annahme: 0x1000) */
		LDR R1, =0x1000

		/* Schleife zur Binarisierung der Daten */
		binarize_loop:
			/* Wert aus dem Speicher laden */
			LDR R2, [R1]

			/* Prüfen, ob das MSB des Werts gesetzt ist */
			TST R2, #0x80000000

			/* Das MSB in das Register R0 speichern (nach links schieben, wenn MSB gesetzt ist) */
			ADREQ R0, R0, LSL #1

			/* Datenzeiger auf die nächste Adresse verschieben (nächste 32-Bit-Zahl) */
			ADD R1, R1, #4

			/* Verringere die Anzahl der noch zu binarisierenden Werte */
			SUBS R3, R3, #1

			/* Schleifenbedingung prüfen (Anzahl der Werte > 0) */
			BGT binarize_loop

stop:
    nop
    bal stop

.end
