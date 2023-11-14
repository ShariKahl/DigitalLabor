/*
 * Aufgabe_3_4.S
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : nterprogrammaufruf mit Übergebe von mehreren Parametern - Division
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:


stop:
	nop
	bal stop

.end

/*
.global _start
.type impartire, %function

impartire:
	ldr r1,[r0]
	ldr r2,[r0, #4]
	mov r3, #0
	cmp r2, #0
	beq stop1
	bne continuare
	
stop1:
nop
bal end

continuare:
	
loopscadere:
	sub r1, r2
	add r3, #1
	cmp r1, #0
	bge biggerOrEqual
less:
	nop
	sub r3, #1
	add r1, r2
	
	bx lr
biggerOrEqual:
	b loopscadere 


	bx lr
	
_start:
	

numere:
.word 27, 3

rezultat:
.word 0

rest:
.word 0


ldr r0 , =numere

bl impartire

ldr r4, =rezultat
ldr r5, =rest

mov r4, r3
mov r5, r1

ldr r6, =rezultat
	


stop:
nop
bal stop

.end*/