/* Kaan Balci Project 1 sort with register 0 taking the largest number in the array */
/* sources used google, class notes, textbook */

.data


.balign 4
array:
	.word 25, 110, 149, 10, 26
length:
	.word (length - array)

.text

.global main


main:
	push {r1-r12, lr}      
	ldr r1, =array          @ load address of array in r1
	ldr r2, =length         @ load address of length in r2
	ldr r2, [r2]            @ load length in r2
	sub r2, #4              @ n-1
	mov r3, #4              @ 1 word = 4 memory bytes

for:                      @ (i=1; i<n-1; i++)
	add r4, r1, r3          @ x=(r1+r3)

while:                         
	ldr r6, [r4], #-4      @ array[x],x-4
	ldr r7, [r4]           @ array[x-1]
	cmp r6, r7            @ is array[element] < array[element-1]
	bge loop                @ branch if ge 
	mov r9,  r7            @ move array[x-1] into r9
	str r6, [r4], #4       @ store array[x] into array[x-1]
	str r9,  [r4], #-4      @ store into r9 array[x-1] into array[x]
	cmp r4,  r1             @ compare is x > 0 
	bgt while               @ branch greater than, is array[x-1] < array[x-2]

loop:                     	 
	cmp r3, r2              @ compare r3 (x) from r2 (n)
	add r3, #4              @ add 4 bytes to r3 
	blt for                 @ end of loop

end:
	ldr r0, [r1, #16] 	@ load into register 0 the last element in the array(4*4 or #16)	
bx lr                  	@ exit
