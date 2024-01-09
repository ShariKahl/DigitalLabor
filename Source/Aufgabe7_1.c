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

#include <stdio.h>

int main(void) 
{
  // Gegebene Konstanten
  uint32_t CONSTANT_A = /* Wert von CONSTANT_A */;
  uint8_t value_a = (CONSTANT_A >> 12) & 0xFF;
  uint8_t value_b = ~CONSTANT_A;
  uint32_t value_c = CONSTANT_A ^ 0xF0000000;
  uint32_t value_d = CONSTANT_A | 0xFF00FF00;

  uint8_t CONSTANT_LOW = /* Wert von CONSTANT_LOW */;
  uint8_t CONSTANT_HIGH = /* Wert von CONSTANT_HIGH */;

  // Big Endian 16 Bit
  uint16_t packed_big_endian_16 = ((uint16_t)CONSTANT_HIGH << 8) | (uint16_t)CONSTANT_LOW;

  // Big Endian 32 Bit
  uint32_t packed_big_endian_32 = ((uint32_t)CONSTANT_HIGH << 16) | (uint32_t)CONSTANT_LOW;

  // Little Endian 16 Bit
  uint16_t packed_little_endian_16 = ((uint16_t)CONSTANT_LOW << 8) | (uint16_t)CONSTANT_HIGH;

  // Ausgabe der Ergebnisse
  printf("value_a: %u\n", value_a);
  printf("value_b: %u\n", value_b);
  printf("value_c: %u\n", value_c);
  printf("value_d: %u\n", value_d);

  printf("Big Endian 16 Bit: %u\n", packed_big_endian_16);
  printf("Big Endian 32 Bit: %u\n", packed_big_endian_32);
  printf("Little Endian 16 Bit: %u\n", packed_little_endian_16);

  return 0;
}
