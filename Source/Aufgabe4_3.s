/*
 * Aufgabe_2_3.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Maximalwert eines Datenblocks ermitteln
 */
.data
datablock1:
    .byte 8   // Größe
    .byte 5   // Status
    .byte 0,1,2,3,4,5,6,7   // Daten

datablock2:
    .byte 8   // Größe
    .byte 0   // Status
    .byte 1,1,1,1,1,1,6,7   // Daten

.text /* Spezifiziere, dass der Code im Textsegment liegt /
.code 32 / Wähle den ARM-Instruktionssatz aus /
.global main / Globales Symbol festlegen */
main:
  ldr r1, =3   // Schwellenwert
  ldrb R4, =0
  ldr R5, =0   // Rückgabe
  ldr r0, =datablock1
  bl getdata
  ldr r0, =datablock2
  bl getdata
  b stop

getdata:
  PUSH {r4,r5,r7,r6}
  ldrb r3, [r0] 
  ldrb r6, [r0, #1]   // Statusbyte
  mov r2, #2
  cmp r6, #5 // Status vergleichen
  bne loop
  POP {r4,r5,r7,r6}
  bx lr

loop:
    mov r5, r5, lsl #1
    ldrb r7, [r0,r2]          // Byte gespeichert mit Hilfe des Pointers
    cmp r7, r1                // Vergleich mit Schwellenwert
    movgt r4, #1              // 1 wenn größer
    movle r4, #0              // 0 wenn kleiner
    strb r4, [r0,r2]          // Speichern in r0
    add r2, r2, #1            // Index für Pointer inkrementieren
    subs r3, r3, #1
    bne loop                  // Schleife, bis alle Datenbytes bearbeitet sind
    cmp r3, #0
    moveq r6, #5             // Status auf 5 wechseln, wenn gleich 0
    strb r6, [r0,#1]         // Status 5 im Datenblock speichern
    POP {r4,r5,r7,r6}
    bx lr

stop:
    nop
    bal stop
.end