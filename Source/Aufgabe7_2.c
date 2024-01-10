/*
 * Aufgabe_7_2.S
 *
 *  Created on: 10.01.2024
 *      Author: Shari Kahl
 *
 *	Aufgabe : GPIO in C
 */
#include <stdint.h>
#include "Aufgabe7_2.h"

// Deklaration
#define IODIR1 (*(volatile uint32_t *)0xE0028018)   // Adresse Port 1 - Ein-/Ausgänge
#define IOSET1 (*(volatile uint32_t *)0xE0028014)   // Adresse Port 1 - Schreiben
#define IOCLR1 (*(volatile uint32_t *)0xE002801C)   // Adresse Clear Register

//  delay() Funktion
void delay() {
    uint32_t counter = 0x0F;

    while (counter > 0) {
        counter--;
    }
}

int main(void) 
{
    uint32_t* ptr_IO1 = (uint32_t *)IODIR1; // Zeiger auf IODIR1
    *ptr_IO1 = 0xFF0000; // P1.16-P1.23 als Ausgang setzen

    uint32_t LED = 0x010000; // Variable für LED-Steuerung, um LED (0b0000.0001) einzuschalten

    while (1) {
        // LED einschalten
        uint32_t* ptr_SET1 = (uint32_t *)IOSET1;
        *ptr_SET1 = LED;

        delay();    // Wartefunktion aufrufen
        delay();    // Wartefunktion aufrufen

        // LED ausschalten
        uint32_t* ptr_CLR1 = (uint32_t *)IOCLR1;
        *ptr_CLR1 = LED;

        delay();    // Wartefunktion aufrufen

        LED = LED << 1; // Bitmaske für die LED-Steuerung um eine Position nach links verschieben

        // Wenn letzte LEDs überrschritten, wieder von vorne
        if (LED >= 0x1000000) {
            LED = 0x10000;
        }
    }

    return 0;
}
