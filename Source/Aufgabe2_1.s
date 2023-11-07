/*
 * Aufgabe_2_1.S
 *
 *  Created on: 05.11.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : 64 Bit Addition
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
      //64-Bit-Addition mit Sprüngen

      /* Eingabezahlen in R0 bis R3, die einen Überlauf verursachen */
      LDR R0, =0x80000000
      LDR R1, =0x80000000
      LDR R2, =0x80000000
      LDR R3, =0x80000000

      /* Eingabezahlen in R0 bis R3, die keinen Überlauf verursachen
      LDR R0, =0x00000001
      LDR R1, =0x00000001
      LDR R2, =0x00000001
      LDR R3, =0x00000001 */

      //Ergebnis in R8, R9 und R10 für Überlauf
      MOV R8, #0
      MOV R9, #0
      MOV R10, #0

      //niederwertigen Zahlen addieren
      ADDS R8, R1, R3      //(R8 = R1 + R3) + Carry-Flag setzen

    //Überlauf der unteren 32-Bit-Addition prüfen
    BCS LowOverflow        //Überlauf bei der unteren 32-Bit-Addition

      ADD R9, R0, R2       // (R9 = R0 + R2)

      LowOverflow:
      //höherwertigen Zahlen addieren
      ADC R9, R0, R2       // (R9 = R0 + R2 + Carry)


    //Überlauf der oberen 32-Bit-Addition prüfen
    BCS HighOverflow       //Überlauf bei der unteren 32-Bit-Addition

      ADD R10, R9, R8      // (R10 = R9 + R8)

      HighOverflow:
      ADC R10, R9, R8      // (R10 = R9 + R8 + Carry)

    
stop:
    nop
    bal stop

.end