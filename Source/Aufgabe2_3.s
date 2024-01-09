/*
 * Aufgabe_2_3.S
 *
 *  Created on: 07.11.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Werte Binarisieren
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

  //Werte initialisieren
variable_werte:
  .word 100, 5896, 44, 0, 123, 987, 0, 65231

main:

  //Register initialisieren
  LDR R0, =0
  
  //Schwellenwert initialisieren
  LDR R1, =400

  //Werte laden
  LDR R2, =variable_werte

  //Datenmenge initialisieren
  LDR R3, =8

  //Veroderung initialisieren
  LDR R4, =0
  
  //Werteregister initialisieren
  LDR R5, =0

loop:
    MOV R5, R5, LSL #1        //R5 = R5 <<1 Inhalt von R0 um eine Stelle nach links verschieben

    LDR R0, [R2], #4          //Wert aus dem Speicher laden und den Zeiger auf die nchste Adresse verschieben
    CMP R0, R1                //Wert > Schwellenwert (400) prfen

    MOVGT R4, #1              //Wenn Wert > 400, setze R4 auf 1
    MOVLE R4, #0              //Andernfalls, setze R4 auf 0

    ORR R5, R4                //beide Werte mit ODER verknpfen
    
    SUBS R3, R3, #1           //Datenmenge um 1 verringern

    BNE loop                  //Schleife wiederholen, bis Datenmenge > 0

stop:
    nop
    bal stop

.end
