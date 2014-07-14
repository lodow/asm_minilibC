[BITS 64]
	global strcmp

	section .text

strcmp:
	push rbp
	mov rbp, rsp


loop_strcmp:
	xor r8, r8
	xor r9, r9
	mov r8B, [rdi]
	mov r9B, [rsi]
	cmp r8B, r9B
	jne end_strcmp
	cmp r8B, 0
	je end_strcmp
	inc rdi
	inc rsi
	jmp loop_strcmp

end_strcmp:
	sub r8, r9
	mov rax, r8

	mov rsp, rbp 		; prologue
	pop rbp
	ret
