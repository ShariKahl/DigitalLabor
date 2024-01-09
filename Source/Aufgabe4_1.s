/*
 * Aufgabe_4_1.S
 *
 *  Created on: 08.12.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Verwendung von Stack
 */
.text /* Specify that code goes in text segment /
.code 32 / Select ARM instruction set /
.global main / Specify global symbol */
main:
    mov r0, #0x44                   //Setze den Wert von Register r0 auf 0x44 
    mov r1, #0x55                   //Setze den Wert von Register r1 auf 0x55

    //Drei mal zur Funktion function1 springen
    bl function1 
    bl function1 
    bl function1 

    b stop 

function1:
    stmfd sp!,{r0,r1,lr}            // r0, r1 auf dem Stack speichern/retten, Linkregister auf dem Stack speichern, Fkt verwendet r0, r1 für temporäre Daten.

    mov r0, #5                      // Lokale 8Bit Variable mit dem Wert 5 initialisieren
    strb r0,[sp,#2]                 // 8 Bit Variable auf dem Stack ablegen 2 Bytes vom Stapelzeiger

    mov r0, #-6                     // Lokale 16Bit Variable mit dem Wert 5 initialisieren
    strh r0,[sp]                    // 16 Bit Variable auf dem Stack ablegen

    ldrb r0, [sp,#2]                //Lade ein Byte vom Speicher, 2 Bytes vom Stapelzeiger, in r0 
    ldrsh r1,[sp,#0]                //Lade ein halbes Wort (mit Vorzeichen) vom Speicher am Stapelzeiger in r1 

    bl function2 

    str r0,[sp, #4]                 // Lade Wert von r0 4 Bytes vom Stapelzeiger entfernt im Speicher 

    ldmfd sp!, {r0,r1,pc}           // r0, r1 von Stack holen, Linkregister von Stack holen und in dem PC Speichen was einem
                                    // Rücksprung an die Aufruferaderesse entspricht

function2:
    adds r0,r0,r1                   // r0+r1 = Ergebnis in r0
    rsbmi r0,r0,#0                  // Falls das Ergebnis negativ ist, invertiere es 

    bx lr

stop:
    nop 
    bal stop 

.end
