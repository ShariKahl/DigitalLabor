/*
 * Aufgabe_4_2.S
 *
 *  Created on: 16.12.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Addition von zwei 8 stelligen BCD Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
    ldr r4, =0x12345678 
    ldr r5, =0x55555555 

    bl add 

    stop:
    nop
    bal stop

add:
    stmfd sp!,{r4-r7}     // r4, r5, r6, r7 auf dem Stack speichern
    mov r0, #8                  // Stellenzhler initialisieren
    mov r1, #0x0000000f         // Stellenmaske initialisieren - 32-Bit-Zahl, die die niederwertigsten Stellen (unteren 4 Bits) markiert
    mov r2, #0                  // Temporre Variable
    mov r3, #0                  // Carry/berlauf initialisieren 
    mov r8,#0                  // Rckgabewert initialisieren 

loop:
    /*r4 und r5 mit der Maske r1 bitweise verknpft, 
    um beide niederwertige Stellen zu isolieren und in r6 bzw. r7 zu speichern*/

    and r6,r1,r4                // Letzte Ziffer von ersten Zahl (r4)
    and r7,r1,r5                // Letzte Ziffer von zweiten Zahl (r5)

    add r2,r6,r7                // Summe der niederwertigen Stellen bilden in r2
    add r2,r2,r3                // Vorhergehenden berlauf bercksichtigen, falls Carry: r3 = 1, sonst 0

    mov r3, #0                  // berlauf zurcksetzen

    subs r2,#10                 // Auf berlauf prfen
    addmi r2,#10                // Falls nach subs eine negative Zahl in r2, addiere wieder 10

    movpl r3,#1                 // berlauf merken, wenn Zahl negativ ist, sonst bleibt berlauf falsch

    add r8,r8,r2              // Zwischenergebnis aktualisieren

    mov r8,r8, ror #4         // Zahlen rotieren fr die nchsten Stellen
    mov r4,r4, ror #4           // Rotation von ersten Zahl (r4)
    mov r5,r5, ror #4           // Rotation von zweiten Zahl (r5)

    subs r0, #1                 // Zhler dekrementieren

    bne loop

    ldmfd sp!,{r4,r5,r6,r7}     // r4, r5, r6, r7 von Stack holen, Linkregister von Stack holen und in dem PC Speichen was einem
                                // Rcksprung an die Aufruferaderesse entspricht
    bx lr 

.end
