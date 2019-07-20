BITS 64
SECTION .text
GLOBAL strpbrk

strpbrk:
	push rbp
	mov rbp, rsp
	push rdi
	jmp pbrbk

increase:
	xor rcx, rcx
	mov rcx, 0
	inc rdi

pbrbk:
	cmp byte [rdi], 0
	je end
	jmp check

check:
	mov r8b, byte [rdi]
	cmp byte [rsi + rcx], 0
	je increase
	cmp byte [rsi + rcx], r8b
	je done
	inc rcx
	jmp check

done:
	mov rax, rdi

end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret