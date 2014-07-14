[BITS 64]
	global memset

	section .text

memset:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop_memset:
	cmp rcx, rdx
	je end_memset
	mov [rdi + rcx], sil
	inc rcx
	jmp loop_memset

end_memset:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
