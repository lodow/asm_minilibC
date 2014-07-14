[BITS 64]
	global memmove

	section .text
memmove:
	push rbp		;epilogue
	mov rbp, rsp

	mov r8, rdi
	mov r9, rsi
	sub r8, r9
	cmp r8, 0		;check overlap
	jge start_to_end	;superieur ou egal - overlap sur la droite
	xor rcx, rcx

start_to_begin:			;overlap on the left
	cmp rcx, rdx
	je end
	mov r8B, [rsi + rcx]
	mov [rdi + rcx], r8B
	inc rcx
	jmp start_to_begin

start_to_end:
	dec rdx
start_to_end2:
	cmp rdx, -1
	je end
	mov r8B, [rsi + rdx]
	mov [rdi + rdx], r8B
	dec rdx
	jmp start_to_end2

end:
	mov rax, rdi
	mov rsp, rbp		;prologue
	pop rbp
	ret
