/*
 * Aufgabe_2_3.S
 *
 *  Created on: 16.12.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Datenstrom Binarisieren
 */
.data
Datablock_1:
    .byte 8                 // Gre des Datenblocks
    .byte 5                 // Status des Datenblocks, processed = 5
    .byte 0,1,2,3,4,5,6,7   // Daten im Block

Datablock_2:
    .byte 8                 // Gre des Datenblocks
    .byte 0                 // Status des Datenblocks, raw = 0
    .byte 1,1,1,1,1,1,6,7   // Daten im Block

.text 
.code 32 
.global main 
main:

  ldr r1, =3                // Schwellenwert
  ldrb r4, =0               // Status eines Datenblocks speichern
  ldr r5, =0                // Rckgabewert  

  ldr r0, =Datablock_1
  bl getdata                // Datenblock 1 analysieren

  ldr r0, =Datablock_2
  bl getdata                // Datenblock 2 analysieren

  b stop                    

getdata:
  PUSH {r4,r5,r7,r6}        // Speicherplatz fr Register sichern

  ldrb r3, [r0]             // Wert des Datenblocks an Stelle r0 holen, r3 = Gre des Datenblocks
  ldrb r6, [r0, #1]         // Wert des Datenblocks an Stelle r0+1 holen, r6 = Statusbyte

  mov r2, #2                // r2 als Zhler initialisieren

  // Status des Datenblocks holen - Bereits bearbeitet?
  cmp r6, #5                // Vergleich des Statusbytes mit 5
  bne loop                  // Falls nicht gleich, zu loop springen
  POP {r4,r5,r7,r6}         // Register wiederherstellen
  bx lr                     // Rckkehr zur aufrufenden Funktion

loop:
    mov r5, r5, lsl #1       // Wert = 1; Inhalt von r5 um 1 Stelle nach links verschieben
     
    ldrb r7, [r0,r2]         // Wert laden, r7 = Byte aus Datenblock an Stelle r2

    cmp r7, r1               // Vergleich des Bytes mit Schwellenwert
    movgt r4, #1             // Wenn Byte > Schwellenwert, r4 = 1
    movle r4, #0             // Wenn Byte <= Schwellenwert, r4 = 0

    strb r4, [r0,r2]         // Speichern von r4 im Datenblock an Stelle r2

    add r2, r2, #1           // Inkrementierung des Zhlers

    subs r3, r3, #1          // Reduzierung der Datenblockgre

    bne loop                 // Schleife, bis alle Datenbytes bearbeitet sind

    cmp r3, #0               // Prfen, ob die Datenblockgre 0 ist
    moveq r6, #5             // Wenn gleich 0, Statusbyte auf 5 setzen

    strb r6, [r0,#1]         // Speichern des neuen Statusbytes

    POP {r4,r5,r7,r6}        // Register wiederherstellen

    bx lr                    

stop:
    nop
    bal stop                 
.end
