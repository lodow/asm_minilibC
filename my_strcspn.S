[BITS 64]
	global strcspn
	extern strlen

	section .text

strcspn:
	push rbp
	mov rbp, rsp

	mov rax, -1

strcspn_loop:
	inc rax
	mov r8b, [rdi + rax]
	cmp r8b, 0
	je end
	xor rdx, rdx

check_val:
	mov r9b, [rsi + rdx]
	cmp r9b, 0
	je strcspn_loop
	cmp r9b, r8b
	je end
	inc rdx
	jmp check_val

end:
	mov rsp, rbp
	pop rbp
	ret
