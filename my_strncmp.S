[BITS 64]
	global strncmp

	section .text

strncmp:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop_strncmp:
	xor r8, r8
	xor r9, r9
	mov r8B, [rdi]
	mov r9B, [rsi]

	cmp rcx, rdx
	je end_force

	cmp r8B, r9B
	jne end_strncmp
	cmp r8B, 0
	je end_strncmp
	inc rdi
	inc rsi
	inc rcx
	jmp loop_strncmp

end_force:
	mov rax, 0

	mov rsp, rbp 		; prologue
	pop rbp
	ret
	
end_strncmp:
	sub r8, r9
	mov rax, r8

	mov rsp, rbp 		; prologue
	pop rbp
	ret
