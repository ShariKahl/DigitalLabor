#ifndef AUFAGBE7_2_H
#define AUFAGBE7_2_H

#include <stdint.h>

// Registeradressen definieren
#define IODIR1 (*(volatile uint32_t *)0xE0028018)
#define IOSET1 (*(volatile uint32_t *)0xE0028014)
#define IOCLR1 (*(volatile uint32_t *)0xE002801C)

// Funktion zur Verzögerung deklarieren
void delay(uint32_t delay_time);

#endif /* AUFAGBE7_2_H */
