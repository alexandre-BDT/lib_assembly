BITS 64
SECTION .text
GLOBAL strcmp

strcmp:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

.strcmp:
	mov r8b, byte [rdi + rcx]
	mov r9b, byte [rsi + rcx]
	cmp byte [rdi + rcx], 0
	je end
	cmp byte [rsi + rcx], 0
	je end
	cmp r8b, r9b
	jne end
	inc rcx
	jmp .strcmp

end:
	sub r8b, r9b
	movsx rax, r8b
	mov rsp, rbp
	pop rbp
	ret