/*
 * Aufgabe_7_1.S
 *
 *  Created on: 09.01.2024
 *      Author: Shari Kahl
 *
 *	Aufgabe : Bitmanipulation in C
 */
#include <stdint.h>
#include "Aufgabe7_1.h"

#include <stdio.h>

#define CONSTANT_A 0x12345678
#define CONSTANT_LOW 0xCD
#define CONSTANT_HIGH 0xAB

int main() {
    uint32_t A = CONSTANT_A;
    uint8_t value_a = (A >> 12) & 0x0F;                     //Schieben nach rechts -eine Division mit Zweierpotenzen
    uint32_t value_b = ~A;                                  //inversen Binären Wert (kein exklusives oder!) 
    uint32_t value_c = ((~A) & 0xF0000000) | (A & 0x0FFFFFFF);  //nur der höchste Nibble ist invertiert
    uint32_t value_d = ((0xFF << 16) | 0xFF) | ((A & 0xFF00FFFF) | 0xFF000000); //alle Bits, bis auf die Nibbels 2&3 auf 1 gesetzt 

    //CONSTANT_HIGH um 8 Bits nach links verschoben (<< 8), durch logisches oder (|) mit CONSTANT_LOW verkettet
    uint16_t combined_8bit_big_endian = ((uint16_t)CONSTANT_HIGH << 8) | CONSTANT_LOW; 
    
    //CONSTANT_HIGH um 16 Bits nach links verschoben, durch logisches oder (|) mit CONSTANT_LOW verkettet
    uint32_t combined_16bit_big_endian = ((uint32_t)CONSTANT_HIGH << 16) | CONSTANT_LOW;
    
    //CONSTANT_LOW um 8 Bits nach links verschoben (<< 8), durch logisches oder (|) mit CONSTANT_HIGH verkettet
    //Bits von CONSTANT_LOW in den höherwertigen Bits, CONSTANT_HIGH niederwertigen Bits -> "Little Indian"-Format
    uint16_t combined_8bit_little_endian = (CONSTANT_HIGH) | ((uint16_t)CONSTANT_LOW << 8);

    /* Ausgaben */
    //printf("CONSTANT_A: %X\n", CONSTANT_A);
    //printf("i_CONSTANT_A: %X\n", ~CONSTANT_A);
    printf("value_a: %X\n", value_a);
    printf("value_b: %X\n", value_b);
    printf("value_c: %X\n", value_c);
    printf("value_d: %X\n", value_d);

    //printf("CONSTANT_HIGH: %B\n", CONSTANT_HIGH);
    //printf("CONSTANT_LOW: %B\n", CONSTANT_LOW);
    printf("combined_8bit_big_endian: %X\n", combined_8bit_big_endian);
    printf("combined_16bit_big_endian: %X\n", combined_16bit_big_endian);
    printf("combined_8bit_little_endian: %X\n", combined_8bit_little_endian);

    return 0;
}
