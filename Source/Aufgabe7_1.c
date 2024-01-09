/*
 * Aufgabe_7_1.S
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Bitmanipulation in C
 */
#include <stdint.h>
#include "Aufgabe7_1.h"

#include <stdint.h>

#define CONSTANT_A 0x12345678
#define CONSTANT_LOW 0xAB
#define CONSTANT_HIGH 0xCD

int main() {
    uint32_t A = CONSTANT_A;
    uint8_t value_a = (A >> 16) & 0xFF;
    uint32_t value_b = ~A;
    uint32_t value_c = ((A & 0xF0000000) ^ 0xF0000000) | (A & 0x0FFFFFFF);
    uint32_t value_d = (A & 0xCFFFFFFF) | 0x30000000;

    uint16_t combined_8bit = ((uint16_t)CONSTANT_HIGH << 8) | CONSTANT_LOW;
    uint32_t combined_16bit = ((uint32_t)CONSTANT_HIGH << 16) | CONSTANT_LOW;
    uint16_t combined_little_endian = (CONSTANT_HIGH) | ((uint16_t)CONSTANT_LOW << 8);

    // Printing the values for demonstration
    printf("value_a: %02X\n", value_a);
    printf("value_b: %08X\n", value_b);
    printf("value_c: %08X\n", value_c);
    printf("value_d: %08X\n", value_d);

    printf("combined_8bit: %04X\n", combined_8bit);
    printf("combined_16bit: %08X\n", combined_16bit);
    printf("combined_little_endian: %04X\n", combined_little_endian);

    return 0;
}
