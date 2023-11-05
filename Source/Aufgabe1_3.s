/*
 * Aufgabe_1_3.S
 *
 *  Created on: 16.10.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Flags und bedingte Ausführung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        /* V1 bedingter Sprung */
	mov R0, #5                 // value
        mov R1, #2                 // threshold
        
        cmp R0, R1                  // Vergleiche value mit threshold
        ble kleiner_oder_gleich     // Springe zu kleiner_oder_gleich, wenn value <= threshold

        mov R0, #1                 // Setze value auf 1, wenn value > threshold
        b end_program               // Springe zum Ende des Programms

        kleiner_oder_gleich:
        mov R0, #0                 // Setze value auf 0, wenn value <= threshold
        

        end_program:                // Ende des Programms


        /* V2 bedingte Ausführung von Befehlen */

        mov R2, #1                // value 
        mov R3, #2                // threshold

        cmp R3, R2                // Vergleiche value mit threshold
        movgt R2, #1              // Setze value auf 1, wenn value > threshold
        movle R2, #0              // Setze value auf 0, wenn value <= threshold

        /* Tests:
            • x = Schwellwert -1
            • x = Schwellwert
            • x = Schwellwert +1
            • x = 0
            • x = Sehr hohe Zahl */

        /* x = Schwellwert - 1 */
        mov R2, #1                // value 
        mov R3, #2                // threshold

        cmp R3, R2                // Vergleiche value mit threshold
        movgt R2, #1              // Setze value auf 1, wenn value > threshold
        movle R2, #0              // Setze value auf 0, wenn value <= threshold

        /* x = Schwellwert */
        mov R2, #1                // value 
        mov R3, #1                // threshold

        cmp R3, R2                // Vergleiche value mit threshold
        movgt R2, #1              // Setze value auf 1, wenn value > threshold
        movle R2, #0              // Setze value auf 0, wenn value <= threshold

        /* x = Schwellwert + 1 */
        mov R2, #3                // value 
        mov R3, #2                // threshold

        cmp R3, R2                // Vergleiche value mit threshold
        movgt R2, #1              // Setze value auf 1, wenn value > threshold
        movle R2, #0              // Setze value auf 0, wenn value <= threshold

        /* x = 0 */
        mov R2, #0                // value 
        mov R3, #5                // threshold

        cmp R3, R2                // Vergleiche value mit threshold
        movgt R2, #1              // Setze value auf 1, wenn value > threshold
        movle R2, #0              // Setze value auf 0, wenn value <= threshold

        /* x = Sehr hohe Zahl */
        mov R2, #1                // value 
        mov R3, #-1                // threshold

        cmp R3, R2                // Vergleiche value mit threshold
        movgt R2, #1              // Setze value auf 1, wenn value > threshold
        movle R2, #0              // Setze value auf 0, wenn value <= threshold

stop:
	nop
	bal stop

.end
