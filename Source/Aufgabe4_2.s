/*
 * Aufgabe_4_2.S
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Addition von zwei 8 stelligen BCD Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
add:
.text /* Spezifiziert, dass der Code im Textsegment liegt */
.code 32 /* Wählt den ARM-Instruktionssatz aus */
.global main /* Spezifiziert ein globales Symbol */

add:
    stmfd sp!,{r4,r5,r6,r7}     // r4, r5, r6, r7 auf dem Stack speichern
    mov r0, #8                  // Zähler
    mov r1, #0x0000000f         // Maske - 32-Bit-Zahl, die die unteren 4 Bits (die niederwertigsten Stellen) markiert
    mov r2, #0                  // Temporäre Variable
    mov r3, #0                  // Carry
    mov r10,#0                  // Rückgabe


loop:
    /*r4 und r5 (vermutlich Zahlen im BCD-Format) mit der Maske r1 bitweise verknüpft, 
    um nur die letzten 4 Bits (die letzten Ziffern) der Zahlen zu isolieren und in r6 bzw. r7 zu speichern*/
    and r6,r1,r4                // Letzte Ziffer von num1 (r4)
    and r7,r1,r5                // Letzte Ziffer von num2 (r5)

    add r2,r6,r7                // Summe der letzten Ziffern in r2
    add r2,r2,r3                // Falls Carry: r3 = 1, sonst 0

    mov r3, #0                  // Reset für Carry
    subs r2,#10                 // Überprüfung für Carry
    addmi r2,#10                // Falls nach subs eine negative Zahl in r2, addiere wieder 10
    movpl r3,#1                 // Carry wird wahr, wenn Zahl negativ ist, sonst bleibt Carry falsch
    add r10,r10,r2              // Temporäre Variable in Rückgabe speichern
    mov r10,r10, ror #4         // Rotation von Rückgabe
    mov r4,r4, ror #4           // Rotation von num1 (r4)
    mov r5,r5, ror #4           // Rotation von num2 (r5)
    subs r0, #1                 // Zähler dekrementieren

    cmp r0, #0
    bne loop

    ldmfd sp!,{r4,r5,r6,r7}     // r4, r5, r6, r7 von Stack holen, Linkregister von Stack holen und in dem PC Speichen was einem
                                // Rücksprung an die Aufruferaderesse entspricht
    bx lr 


main:
    ldr r4, =0x12345678 
    ldr r5, =0x55555555 

    bl add 

stop:
    nop
    bal stop
.end
