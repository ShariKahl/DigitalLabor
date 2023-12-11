/*
 * Aufgabe_3_2.S
 *
 *  Created on: 24.11.23
 *      Author: Shari Kahl
 *
 *	Aufgabe : Unterprogrammaufruf  mit Parametern
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

  //Werte initialisieren
variable_werte:
  .word 100, 5896, 44, 0, 123, 987, 0, 65231

  //Schleifenzähler/Konstante initialisieren
  .equ schleifenzähler, 5
 
  //delay Zeit initialisieren 
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

while:
    MOVS R3, R3               //Prüfen, ob Schleifenzähler = 0
    BEQ whileEnde             //Schleife beenden, wenn Schleifenzähler = 0

    LDR R0, [R2], #4          //Wert aus dem Speicher laden 
    MOV R0, R0, LSL #1        //R0 = R0 <<1 Inhalt von R0 um eine Stelle nach links verschieben

    CMP R0, R1                //Wert > Schwellenwert (400) prüfen

    MOVGT R4, #1              //Wenn R5 > 400, setze R0 auf 1
    MOVLE R4, #0              //Andernfalls, setze R0 auf 0

    ORR R5, R4                //beide Werte mit ODER verknüpfen
    
    LDR R6, =delaytime        //Verzögerungszeit laden

    //Verzögerungszeit als Parameter übergeben
    BL delay                  //Verzögerungszeit = Parameter

    SUBS R3, R3, #1           //Datenmenge um 1 verringern
    B while                   //Schleife wiederholen, bis Datenmenge > 0

whileEnde:                    //Schleifenende, Programm geht weiter
    CMP R3, #0                //Prüfen, ob Schleifenzähler = 0
    BEQ stop                  //Springe zu stop, wenn Schleifenzähler = 0
    B while                   //Andernfalls weiter in while

stop:
    nop
    bal stop

.global temp_reg              //Globale Variable für das temporäre Register

delay:
    
delay_loop:
    SUBS R6, #1               //Verzögerung um 1 dekrementieren
    BNE delay_loop            //Solange R6 != 0, loop wiederholen

    bx LR                     //Springe zurück zur aufrufenden Stelle

.end
