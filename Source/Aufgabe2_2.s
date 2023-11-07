/*
 * Aufgabe_2_2.S
 *
 *  Created on: 07.11.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Multiplikation
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
    //Vorzeichenlose Multiplikation durch wiederholte Addition

    //Multiplikand und Multiplikator in R0 und R1 speichern
    LDR R0, =10 		//Multiplikand
    LDR R1, =3 			//Multiplikator

    //Ergebnis in R2 und Überlauf in R3 initialisieren
    MOV R2, #0 					//Ergebnis
    MOV R3, #0 					//Überlauf

    DoWhileSchleife:
        //Erhöhe das Ergebnis um den Multiplikand
        ADDS R2, R2, R0 		//R2 = R2 + R0

        //Auf Überlauf prüfen
        BCC NoOverflow

        //Überlauf
        ADD R3, R3, #1 			//Überlauf erhöhen

    NoOverflow:
        //Multiplikator dekrementieren
        SUBS R1, R1, #1 		//R1 = R1 - 1 

        //Schleifenbedingung prüfen (Multiplikator != 0)
        CMP R1, #0
        BNE DoWhileSchleife

    stop:
        nop
        bal stop

.end