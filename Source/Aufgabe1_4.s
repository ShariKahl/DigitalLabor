/*
 * Aufgabe_1_4.S
 *
 *  Created on: 16.10.2023
 *      Author: Shari Kahl
 *
 *	Aufgabe : Maskenoperationen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
	.equ BREAD_bm, (1<<0)
	.equ BUTTER_bm, (1<<1)
        .equ CHEESE_bm, (1<<2)
        
	.equ ORANGE_bm, (1<<4)
	.equ BANANA_bm, (1<<5)
        .equ KIWI_bm, (1<<6)

        .equ WATER_bm, (1<<8)
	.equ MILK_bm, (1<<9)
        .equ FANTA_bm, (1<<10)

        .equ SNACKS_bm, (BREAD_bm | BUTTER_bm | CHEESE_bm)
	.equ FRUITS_bm, (ORANGE_bm | BANANA_bm | KIWI_bm)
        .equ DRINKS_bm, (WATER_bm | MILK_bm | FANTA_bm)

        .equ BREAKFAST_bm, (SNACKS_bm | MILK_bm | KIWI_bm)

	ldr R0, =BREAKFAST_bm
	ldr R1, =(BREAKFAST_bm | FRUITS_bm) 
	ldr R2, =(BREAKFAST_bm | FANTA_bm) & ~MILK_bm
	ldr R3, =(MILK_bm | FRUITS_bm | MILK_bm<<16)
	ldr R4, =(BREAKFAST_bm & (~(MILK_bm | CHEESE_bm)))
      
stop:
	nop
	bal stop

.end
