/*
 * Aufgabe_5_3.S
 *
 *  Created on: 08.01.2024
 *      Author: Shari Kahl
 *
 *	Aufgabe : Ein- und Ausgabe über Taster und LEDs
 */

.text /* Specify that code goes in the text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

.equ IODIR1, 0x08 // Adresse Port 1 - Ein-/Ausgänge
.equ IOSET1, 0x04 // Adresse Port 1 - Schreiben
.equ IOCLR1, 0x0C // Adresse Clear Register

.equ IOPIN0, 0xE0028000
.equ BUTTON_0, (1 << 0)    // Maske Button 0
.equ BUTTON_1, (1 << 1)    // Maske Button 1
.equ BUTTON_3, (1 << 3)    // Maske Button 3

.equ LED_MASK, 0x0F

main:
  LDR sp, =0x40001000 // Initialisiere den Stackpointer

  // Konfiguration der Pins
setup:
  LDR r4, =#IOPIN0 // Lade die Adresse für den Pin-Input 0
  LDR r9, =#IODIR1 // Lade die Adresse für den Pin-Output 1

  // Initialisierung des Lauflichts
  LDR R1, =IODIR1   // Zeiger auf IODIR1
  LDR R0, =0xFF0000 // P1.16-P1.23 als Ausgang setzen  / 0xFF"0000" --> die 4x0 für P1.23-P1.16
  STR R0, [R1]       // Speichere Wert 0xFF (Ausgang) auf die Adresse IODIR1

  LDR R0, =0x010000 // R0 mit 0x10 laden, um LED (0b0000.0001) einzuschalten

// Endlosschleife
loop:
  // Lauflicht 1
  LDR R1, =IOSET1   // Zeiger auf IOSET1
  STR R0, [R1]

  BL delay           // Wartefunktion aufrufen

  LDR R1, =IOCLR1   // Clear der LED
  STR R0, [R1]

  BL delay

  MOV R0, R0, lsl #1 // die 1 nach links verschieben

  cmp r0, #0x1000000 // Wenn letzte LEDs überschritten
  ldreq r0, =0x10000 // wieder von vorne

  // Tastenabfrage
  LDR r0, =#BUTTON_0 // Lade die Adresse für Button 0
  BL checkButton     // Überprüfe Button 0

  LDR r0, =#BUTTON_1 // Lade die Adresse für Button 1
  BL checkButton     // Überprüfe Button 1

  LDR r0, =#BUTTON_3 // Lade die Adresse für Button 3
  BL checkButton     // Überprüfe Button 3

  B loop             // Zurück zu Loop

delay:
  PUSH {R0, R1}      // Arbeitsregister speichern / Register auf den Stack sichern
  LDR R5, =0x500000  // Wartezeit einstellen

delay_loop:
  SUBS R5, #1
  BNE delay_loop

  POP {R0, R1}       // Arbeitsregister aus Stack zurückholen
  BX LR

// Funktion zum Überprüfen des Tasterzustands
checkButton:
  MOV r6, r0         // Setze die Maskierung für die LEDs
  MOV r5, r1
  LDR r7, [r4]       // Lade den Wert von IOPIN0 in r5 (Tasterzustände)
  ANDS r7, r5, r7    // Überprüfe, ob der Button gedrückt wurde
  BEQ buttonPressed  // Falls der Button gedrückt wurde, springe zu buttonPressed
  BNE buttonNotPressed // Falls nicht, springe zu buttonNotPressed

// Funktion, falls der Button gedrückt wurde
buttonPressed:
  STR r6, [r9, #IOSET1] // Schalte die LEDs an (IOSET)
  MOV r6, r6, lsr #4 // Verschiebe die Maskierung für die zweite LED
  STR r6, [r9, #IOCLR1] // Schalte die zweite LED aus (IOCLR)
  BX lr // Springe zurück zum Aufrufer

// Funktion, falls der Button nicht gedrückt wurde
buttonNotPressed:
  STR r6, [r9, #IOCLR1] // Schalte die LEDs aus (IOCLR)
  MOV r6, r6, lsr #4 // Verschiebe die Maskierung für die zweite LED
  STR r6, [r9, #IOSET1] // Schalte die zweite LED an (IOSET)
  BX lr // Springe zurück zum Aufrufer

stop:
  nop
  bal stop

.end
