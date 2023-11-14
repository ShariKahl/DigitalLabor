/*
 * Aufgabe_3_2.S
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Unterprogrammaufruf  mit Parametern
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
.text
.code 32

.global _start
.type countdown, %function

countdown: 
subs r5, r5, #1
bx r5



_start:
	
	mov r0, #0
	mov r1, #90
	mov r5, #8
	
variable_a:
.word 100, 75, 80, 92, 110, 60, 120, 130

ldr r2, =variable_a


while:

beq whileEnde

ldr r3, [r2], #4

mov r0,r0, lsl#1

cmp r3,r1 
orrgt r0,#1
bl countdown
b while
whileEnde:

stop:
nop
bal stop

.end*/