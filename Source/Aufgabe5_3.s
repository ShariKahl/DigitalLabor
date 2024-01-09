/*
 * Aufgabe_5_3.S
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Ein- und Ausgabe über Taster und LEDs
												  
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

.equ IOPIN0, 0xE0028000
.equ IOPIN1, 0xE0028010
.equ IOSET1, 0x04
.equ IODIR1, 0x08
.equ IOCLR1, 0x0C
.equ BUTTON_1, (1 << 10)    // Maske Button 1 
.equ BUTTON_2, (1 << 11)    // Maske Button 2
.equ BUTTON_3, (1 << 12)    // Maske Button 3
.equ BUTTON_4, (1 << 13)    // Maske Button 4
.equ LED_MASK, 0x0F

main:
  LDR sp, =0x40001000 // Initialisiere den Stackpointer

// Konfiguration der Pins
setup:
  LDR r4, =#IOPIN0 // Lade die Adresse für den Pin-Input 0
  LDR r9, =#IOPIN1 // Lade die Adresse für den Pin-Output 1

// Endlosschleife für das Auslesen der Taster
loop:
  LDR r0, =#BUTTON_1 // Lade die Adresse für Button 1
  LDR r1, =1<<20 // Lade die Konstante 20 in r1
  
  BL checkButton // Überprüfe Button 1
  
  LDR r0, =#BUTTON_2 // Lade die Adresse für Button 2
  LDR r1, =1<<21 // Lade die Konstante 21 in r1
  
  BL checkButton // Überprüfe Button 2
  
  LDR r0, =#BUTTON_3 // Lade die Adresse für Button 3
  LDR r1, =1<<22 // Lade die Konstante 22 in r1
  
  BL checkButton // Überprüfe Button 3
  
  LDR r0, =#BUTTON_4 // Lade die Adresse für Button 4
  LDR r1, =1<<23 // Lade die Konstante 23 in r1
  
  BL checkButton // Überprüfe Button 4
  
  B loop // Gehe zurück zur Endlosschleife



// Funktion zum Überprüfen des TasterzustANDS
checkButton:
  MOV r6, r1 // Setze die Maskierung für die LEDs
  MOV r5, r0  
  LDR r7, [r4] // Lade den Wert von IOPIN0 in r5 (Tasterzustände)
  ANDS r7, r5, r7 // Überprüfe, ob der Button gedrückt wurde
  BEQ buttonPressed // Falls der Button gedrückt wurde, springe zu buttonPressed
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