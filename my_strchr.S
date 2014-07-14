[BITS 64]
	global strchr

	section .text

strchr:
	push rbp
	mov rbp, rsp

loop_strchr:
	mov r8b, [rdi]
	cmp sil, r8b
	je fin_strchr
	cmp r8b, 0
	je fin_notfound
	inc rdi
	jmp loop_strchr

fin_strchr:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret

fin_notfound:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret
