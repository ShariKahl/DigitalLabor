/*
 * Aufgabe_5_2.S
 *
 *  Created on: 08.01.2024
 *      Author: Shari Kahl
 *
 *	Aufgabe : Permanentes Lauflicht
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

  // Deklaration
.equ IODIR1, 0xE0028018 // Adresse Port 1 - Ein-/Ausgänge
.equ IOSET1, 0xE0028014 // Adresse Port 1 - Schreiben
.equ IOCLR1, 0xE002801C  // Adresse Clear Register

// Initialisierung
main:
  LDR R1, = IODIR1   // Zeiger auf IODIR1
  LDR R0, = 0xFF0000 // P1.16-P1.23 als Ausgang setzen  / 0xFF"0000" --> die 4x0 für P1.23-P1.16 
  STR R0, [R1]       // Speichere Wert 0xFF (Ausgang) auf die Adresse IODIR1

  LDR R0, = 0x010000 // R0 mit 0x10 laden. um LED (0b0000.0001) einzuschalten

// Endlosschleife
loop:
  LDR R1, = IOSET1   // Zeiger auf IOSET1
  STR R0, [R1]
  
  BL delay           // Wartefunktion aufrufen
  BL delay

  LDR R1, = IOCLR1   // Clear der LED
  STR R0, [R1]

  BL delay

  MOV R0, R0, lsl #1 // die 1 nach links verschieben

  cmp r0, #0x1000000 // Wenn letzte LEDs überrschritten
  ldreq r0, =0x10000 // wieder von vorne

  B loop             // Zurück zu Loop


delay:
  PUSH {R0, R1}             //Arbeitsregister speichern / Register auf den Stack sichern
  LDR R5, = 0x500000            // Wartezeit einstellen      

delay_loop:
  SUBS R5, #1
  BNE delay_loop

  POP {R0, R1}              //Arbeitsregister aus Stack zurückholen
  BX LR

stop:
  nop
  bal stop

.end