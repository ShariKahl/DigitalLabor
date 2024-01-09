/*
 * Aufgabe_3_3.S
 *
 *  Created on: 27.11.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Unterprogrammaufruf  mit Parameterübergabe über dem Stack
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

  //Werte initialisieren
variable_werte:
  .word 100, 5896, 44, 0, 123, 987, 0, 65231

  //Schleifenzähler/Konstante initialisieren
  .equ schleifenzähler, 5
 
  //Verzögerungszeit 
  .equ delaytime, 3

main:

  //Register initialisieren für variable_werte
  MOV R0, #0
  
  //Schwellenwert initialisieren
  MOV R1, #400

  //Werte laden / Speicheradresse 
  LDR R2, =variable_werte

  //Schleifenzähler laden
  LDR R3, =schleifenzähler 

  //Veroderung initialisieren
  LDR R4, =0
  
  //Werteregister initialisieren
  LDR R5, =0

loop:
  LDR R0, [R2], #4          //Wert aus dem Speicher laden 
  MOV R0, R0, LSL #1        //R0 = R0 <<1 Inhalt von R0 um eine Stelle nach links verschieben

  CMP R0, R1                //Wert > Schwellenwert (400) prüfen

  MOVGT R4, #1              //Wenn R5 > 400, setze R0 auf 1
  MOVLE R4, #0              //Andernfalls, setze R0 auf 0

  ORR R5, R4                //beide Werte mit ODER verknüpfen

  LDR R6, =delaytime 

  PUSH {R6}                 //Register sichern

  BL delay                  //Verzögerung aufrufen

  POP {R6}                  //Temporäre Register wiederherstellen und zurückspringen

  SUBS R6, #1               //Verzögerung um 1 dekrementieren

  B loop                    //Schleife wiederholen

stop:
	nop
	bal stop

        delay:
        PUSH {R0}             //Arbeitsregister speichern / Register auf den Stack sichern
        LDR R0, [sp, #4]      

        delay_loop:
          SUBS R0, #1
          BNE delay_loop

        pop {R0}
        BX LR

.end
