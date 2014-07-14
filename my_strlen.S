[BITS 64]
	global strlen

	section .text

strlen:

	push rbp
	mov rbp, rsp

	mov rcx, 0

loop_strlen:
	mov r8b, [rdi + rcx]
	cmp r8b, 0
	je fin_strlen
	inc rcx
	jmp loop_strlen

fin_strlen:
	mov rax, rcx
	mov rsp, rbp
	pop rbp
	ret
