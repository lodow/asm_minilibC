[BITS 64]
	global rindex
	extern strlen

	section .text

rindex:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	xor rax, rax

loop_rindex:
	mov r8b, [rdi + rcx]
	cmp r8b, sil
	je is_found
label_loop:
	cmp r8b, 0
	je end
	inc rcx
	jmp loop_rindex

is_found:
	mov rdx, rdi
	add rdx, rcx
	mov rax, rdx
	jmp label_loop

end:
	mov rsp, rbp
	pop rbp
	ret
