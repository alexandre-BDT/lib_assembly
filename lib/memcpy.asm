BITS 64
SECTION .text
GLOBAL memcpy

memcpy:
	push rbp
	mov rbp, rsp
	mov rax, 0
	cmp rdi, 0
	je .end

.memcpy:
	cmp byte [rdi], 0
	je .end
	cmp rdx, rax
	je .end
	mov r9b, byte [rsi]
	mov byte [rdi], r9b
	inc rdi
	inc rsi
	inc rax
	jmp .memcpy

.end:
	mov rsp, rbp
	pop rbp
	ret