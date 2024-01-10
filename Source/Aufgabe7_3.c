/*
 * Aufgabe_7_3.S
 *
 *  Created on: 10.01.2024
 *      Author: Shari Kahl
 *
 *	Aufgabe : Umschaltbares Lauflicht
 */
#include <stdint.h>
#include "Aufgabe7_3.h"

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
}
