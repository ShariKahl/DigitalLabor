/*
 * Aufgabe_4_1.S
 *
 *  Created on: 08.12.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Verwendung von Stack
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
    //Ergebnis in R2 und Überlauf in R3 initialisieren
    mov r0, #0x44
    mov r1, #0x55

    bl function1
    bl function1
    bl function1
    bl stop

function1:
    // Platz für lokale Variablen auf dem Stack reservieren
    // Für a (uint8 = 5), b (int16 = -6), und c (uint32 = 0)
    push {r4, lr} // Speicherplatz für a, b und c reservieren
    ldr r4, [sp,#4]

    // Variablen initialisieren
    mov r4, #5      // a = 5
    mov r5, #-6     // b = -6
    mov r6, #0      // c = 0

    // Die Werte von a und b in R0 und R1 laden
    mov r0, r4      // a in R0 laden
    mov r1, r5      // b in R1 laden

    // Zweite Funktion aufrufen
    bl function2

    // Rückgabewert in c speichern
    mov r6, r0      // Rückgabewert von function2 in c speichern

    pop {r4, lr}   // Stack bereinigen

    bx lr           // Funktion beenden und zurückkehren

function2:
    // Variablen für die Funktion2 (falls erforderlich)
    push {r4, r5, lr} // Speicherplatz für temporäre Variablen und Rückkehradresse reservieren

    // Werte von R0 und R1 addieren
    add r4, r0, r1    // r4 = R0 + R1

    // Absolutwert der Summe berechnen
    cmp r4, #0        // Vergleiche r4 mit 0
    bge positiv      // Springe zu positiv, wenn r4 >= 0
    neg r4, r4        // Sonst negiere r4 (also positiv)

positiv:
    // Rückgabewert in R0 speichern
    mov r0, r4        // Absolutwert in R0 speichern

    pop {r4, r5, lr}  // Stack bereinigen

    bx lr             // Funktion beenden und zurückkehren


stop:
	nop
	bal stop

.end
