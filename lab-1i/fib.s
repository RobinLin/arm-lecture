	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	
	@ PROLOG
	push {r3, r4, r5, lr}
	
	subs r3, r0, #0

	mov r4, #0	@previous = 0
	mov r5, #1	@result = 1

	cmp r4, r3
	ble .Loop
	pop {r3, r4, r5, pc}
.Loop:
	add r0, r4, r5	@sum = result + previous
	mov r4, r5 	@previous = result
	mov r5, r0 	@result = sum
	
	subs r3, r3, #1
	cmp r3, #1	
	bgt .Loop
	pop {r3, r4, r5, pc}

	.size fibonacci, .-fibonacci
	.end
