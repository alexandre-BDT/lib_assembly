BITS 64
SECTION .text
GLOBAL strncmp

strncmp:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	cmp rdx, 0
	je zero

loop:
	mov r8b, byte [rdi + rcx]
	mov r9b, byte [rsi + rcx]
	cmp rcx, rdx
	je end
	cmp byte [rdi + rcx], 0
	je end
	cmp byte [rsi + rcx], 0
	je end
	cmp r8b, r9b
	jne end
	inc rcx
	jmp loop

zero:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret

end:
	sub r8b, r9b
	movsx rax, r8b
	mov rsp, rbp
	pop rbp
	ret