/*
 * Aufgabe_3_4.S
 *
 *  Created on: 27.11.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Unterprogrammaufruf mit Übergebe von mehreren Parametern - Division
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

.equ dividend, 10
.equ divisor, 3

main:
        LDR R0, =dividend       // Dividend in R0 laden
        LDR R1, =divisor        // Divisor in R1 laden

        BL division             // Division aufrufen

stop:
	nop
	bal stop

        division:
        MOV R2, #0              // Ergebnis
        MOV R3, #0              // Rest
        MOV R4, #0              // Fehlerregister

        CMP R1, #0               // Prüfen, ob Divisor = 0
        MOVEQ R4, #1             // Fehler-Flag setzen
        BEQ division_error       // Wenn Divisor = 0, Fehlerbehandlung

division_subtract:
        ADDS R2, #1              // Ergebnis erhöhen
        SUBS R0, R1              // Dividend - Divisor

        BGT division_subtract

        ADDLT R0, R1             
        SUBLT R3, #1               

division_error:
        BX LR    
.end
